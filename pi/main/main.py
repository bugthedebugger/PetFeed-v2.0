#! /usr/bin/python3

from server import FlaskServer
from models.model import Model
from models.schedule import Schedule
import RPi.GPIO as GPIO
from hw_controllers.motor_controller import MotorController
from hw_controllers.distance import Distance
from pusher_server import PusherContainer
from threading import Thread
from datetime import datetime
import signal
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

motorController = MotorController(GPIO=GPIO)
distanceSensor = Distance(GPIO=GPIO)
pusherContainer = PusherContainer(
    motorController=motorController, distanceSensor=distanceSensor)


def flask_server():
    flaskServer = FlaskServer(
        motorController=motorController, _distanceSensor=distanceSensor)
    flaskServer.start()


def pusher_server():
    pusherContainer.connect()


def amount_trigger():
    time.sleep(5)
    while True:
        pusherContainer.foodMeter()
        time.sleep(10)


def scheduled_feeding():

    results = db.selectAll(Device())
    device.from_map(results[0])

    while True:
        today_day = datetime.now().strftime('%A')
        now_time = datetime.now().strftime('%H:%M:%S')
        results = db.selectAll(Schedule())

        for result in results:
            schedule.from_map(result)
            if schedule.day == today_day and schedule.time == now_time:
                if device.type == 'Fish':
                    motorController.fish(duration=schedule.amount)

        time.sleep(1)


def sync_to_server():
    pass


if __name__ == '__main__':
    flask_thread = Thread(target=flask_server)
    pusher_thread = Thread(target=pusher_server)
    amount_thread = Thread(target=amount_trigger)
    scheduled_feeding_thread = Thread(target=scheduled_feeding)

    flask_thread.start()
    pusher_thread.start()
    amount_thread.start()
    scheduled_feeding_thread.start()
