#! /usr/bin/python3

import os
# from pusher import Pusher as PusherEvent
import time

import pysher as PusherClient
from models.dbcontroller import DBController
from models.device import Device
# from hw_controllers.motor_controller import MotorController
import ast
import pusher_credentials as creds

# motors = MotorController()


def test(data):
    print(data)


class PusherContainer:
    pusherClient = None

    def __init__(self, motorController):
        device = Device()
        self.db = DBController()
        results = self.db.selectAll(device)
        device.from_map(results[0])
        self.channel = device.deviceId
        self.motors = motorController

    def password_reset(self, data):
        data = ast.literal_eval(data)

        print(data)

        if data['channel'] == self.channel:
            device = Device()
            result = self.db.selectAll(device)
            device.from_map(result[0])
            print(data['oldPassword'])
            print(device.password)
            print(data['newPassword'])
            print(device.password == data['oldPassword'])
            if device.password == data['oldPassword']:
                device.password = data['newPassword']
                self.db.update(device)
            else:
                print('cant reset')
        else:
            print('passed')

    def configure(self, data):
        data = ast.literal_eval(data)
        if data['channel'] == self.channel:
            print('here')
            token = data['token']
            device = Device()
            result = self.db.selectAll(device)
            device.from_map(result[0])
            device.accessToken = token
            r = self.db.update(device)
            print(r)

    def treat(self, data):
        data = ast.literal_eval(data)
        amount = data['amount']

        device = Device()
        self.db = DBController()
        results = self.db.selectAll(device)
        device.from_map(results[0])

        if device.type == 'Fish':
            self.motors.fish(duration=amount)

        print(amount)

    @staticmethod
    def restart(data):
        # os.system("sudo reboot")
        print('received restart')

    @staticmethod
    def shutdown(data):
        # os.system("sudo poweroff")
        print('received shutdown')

    @staticmethod
    def test(data):
        print(data)

    def register(self, data):
        data = ast.literal_eval(data)

        if data['channel'] == self.channel:
            device = Device()
            results = self.db.selectAll(device)
            device.from_map(results[0])

            if device.password == data['oldPassword'] and device.deviceId == data['channel']:
                device.password = data['newPassword']
                device.type = data['type']
                device.typeId = data['typeId']
                r = self.db.update(device)

    def connect_handler(self, data):
        petfeed_channel = self.pusherClient.subscribe(self.channel)
        petfeed_channel.bind('test', self.test)
        petfeed_channel.bind('petfeed-restart', self.restart)
        petfeed_channel.bind('petfeed-reset-password', self.password_reset)
        petfeed_channel.bind('petfeed-shutdown', self.shutdown)
        petfeed_channel.bind('petfeed-configure', self.configure)
        petfeed_channel.bind('petfeed-treat', self.treat)
        petfeed_channel.bind('petfeed-register', self.register)

    def connect(self):
        self.pusherClient = PusherClient.Pusher(key=creds.key, secret=creds.secret,
                                                cluster=creds.cluster)
        self.pusherClient.connection.bind(
            'pusher:connection_established', self.connect_handler)
        self.pusherClient.connect()

        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            self.pusherClient.disconnect()

    def __del__(self):
        self.pusherClient.disconnect()
