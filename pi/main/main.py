#! /usr/bin/python3

from server import FlaskServer
from models.model import Model
import RPi.GPIO as GPIO
from hw_controllers.motor_controller import MotorController
from hw_controllers.distance import Distance
from pusher_server import PusherContainer
from threading import Thread
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
    pass


def sync_to_server():
    pass


if __name__ == '__main__':
    flask_thread = Thread(target=flask_server)
    pusher_thread = Thread(target=pusher_server)
    amount_thread = Thread(target=amount_trigger)

    flask_thread.start()
    pusher_thread.start()
    amount_thread.start()
