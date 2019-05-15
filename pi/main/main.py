#! /usr/bin/python3

from server import FlaskServer
from models.model import Model
from hw_controllers.motor_controller import MotorController
from pusher_server import PusherContainer


flaskServer = FlaskServer()
flaskServer.start()
pusherContainer = PusherContainer()
pusherContainer.connect()
