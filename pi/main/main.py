#! /usr/bin/python3

from server import FlaskServer
from models.model import Model
# from hw_controllers.motor_controller import MotorController
from models.dbcontroller import DBController
import RPi.GPIO as GPIO

flaskServer = FlaskServer(GPIO=GPIO, dbController=DBController)
flaskServer.start()
