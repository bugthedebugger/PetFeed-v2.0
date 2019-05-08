#! /usr/bin/python3

from server import FlaskServer
from models.model import Model
# from hw_controllers.motor_controller import MotorController
from models.dbcontroller import DBController

db = DBController()
flaskServer = FlaskServer(dbController=DBController)
flaskServer.start()
