#! /usr/bin/python3

from server import FlaskServer
from models.model import Model
from models.dbcontroller import DBController
from models.schedule import Schedule
from models.device import Device
from models.history import History
import RPi.GPIO as GPIO
from hw_controllers.motor_controller import MotorController
from hw_controllers.distance import Distance
from hw_controllers.weight import WeightSensor
from pusher_server import PusherContainer
from threading import Thread
from datetime import datetime
import signal
import time
import requests

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

weightSensor = None

# try:
weightSensor = WeightSensor(GPIO=GPIO, dout_pin=21, pd_sck_pin=20)
# except:
#     weightSensor = None
scheduleSyncURL = 'https://prayush.karkhana.asia/api/schedule/set'
motorController = MotorController(GPIO=GPIO, weightSensor=weightSensor)
distanceSensor = Distance(GPIO=GPIO)
pusherContainer = PusherContainer(
    motorController=motorController, distanceSensor=distanceSensor)


def flask_server():
    flaskServer = FlaskServer(
        motorController=motorController, _distanceSensor=distanceSensor, _dbController=DBController())
    flaskServer.start()


def pusher_server():
    pusherContainer.connect()


def amount_trigger():
    time.sleep(5)
    while True:
        pusherContainer.foodMeter()
        time.sleep(5)


def scheduled_feeding():
    db = DBController()
    results = db.selectAll(Device())
    device = Device()
    device.from_map(results[0])

    while True:
        today_day = datetime.now().strftime('%A')
        now_time = datetime.now().strftime('%-H:%M:%S')
        results = db.selectAll(Schedule())

        for result in results:
            schedule = Schedule()
            schedule.from_map(result)
            # print(now_time + ' --- ' + str(schedule.time))
            # print(now_time == schedule.time)
            if schedule.day == today_day and str(schedule.time) == now_time:
                history = History()
                history.from_map({
                    'schedule_uid': schedule.uId,
                    'synced': 0,
                    'fed': 1,
                    'amount': schedule.amount
                })
                # print('inside first if')
                if device.type == 'Fish':
                    motorController.fish(duration=schedule.amount)
                else:
                    motorController.wtFeed(amount=schedule.amount)

                db.insert(history)

        time.sleep(1)


def sync_to_server():
    device = Device()
    db = DBController()
    results = db.selectAll(device)
    device.from_map(results[0])
    accessToken = device.accessToken
    deviceId = device.deviceId
    schedule = Schedule()
    tempSchedule = Schedule()

    while True:
        schedules = db.selectAll(schedule)
        try:
            for s in schedules:
                # print(s)
                tempSchedule = Schedule()
                tempSchedule.from_map(s)
                if tempSchedule.synced == 0:
                    if tempSchedule.deleted == 0:
                        schedule_from_server = requests.post(
                            url=scheduleSyncURL,
                            headers={
                                'Accept': 'application/json',
                                'Authorization': 'Bearer ' + accessToken,
                                'Content-Type': 'application/json'
                            },
                            json={
                                'day': tempSchedule.day,
                                'feedTime': str(tempSchedule.time),
                                'amount': tempSchedule.amount,
                                'groupId': tempSchedule.groupId,
                                'deleted': False,
                                'uId': tempSchedule.uId,
                                'deviceId': deviceId,
                                'petId': tempSchedule.petId,
                                'serverId': tempSchedule.serverId
                            }
                        )
                        print(schedule_from_server.text)
                        print(schedule_from_server.status_code)
                        if schedule_from_server.status_code == 200:
                            print(
                                '````````````````````````````````````````````````````')
                            schedule_from_server = schedule_from_server.json()
                            tempSchedule.serverId = schedule_from_server['id']
                            tempSchedule.synced = 1
                            db.update(tempSchedule)
                            # print('db update')
                            # print(
                            #     '````````````````````````````````````````````````````')
                    else:
                        schedule_from_server = requests.post(
                            url=scheduleSyncURL,
                            headers={
                                'Accept': 'application/json',
                                'Authorization': 'Bearer ' + accessToken,
                                'Content-Type': 'application/json'
                            },
                            json={
                                'day': tempSchedule.day,
                                'feedTime': str(tempSchedule.time),
                                'amount': tempSchedule.amount,
                                'groupId': tempSchedule.groupId,
                                'deleted': True,
                                'uId': tempSchedule.uId,
                                'deviceId': deviceId,
                                'petId': tempSchedule.petId,
                                'serverId': tempSchedule.serverId
                            }
                        )
                        # print(schedule_from_server.text)
                        if schedule_from_server.status_code == 200:
                            db.delete(tempSchedule)
        except:
            print('Exception occured')
        time.sleep(5)


if __name__ == '__main__':
    flask_thread = Thread(target=flask_server)
    pusher_thread = Thread(target=pusher_server)
    amount_thread = Thread(target=amount_trigger)
    scheduled_feeding_thread = Thread(target=scheduled_feeding)
    sync_to_server_thread = Thread(target=sync_to_server)

    flask_thread.start()
    pusher_thread.start()
    amount_thread.start()
    scheduled_feeding_thread.start()
    sync_to_server_thread.start()
