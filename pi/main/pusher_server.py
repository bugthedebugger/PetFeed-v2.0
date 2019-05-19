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
import pusher as PusherEvent

# motors = MotorController()


def test(data):
    print(data)


class PusherContainer:
    pusherClient = None
    pusherEvent = None

    def __init__(self, motorController):
        device = Device()
        self.db = DBController()
        results = self.db.selectAll(device)
        device.from_map(results[0])
        self.channel = 'private-' + device.deviceId
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
                self.pusherEvent.trigger(self.channel, 'petfeed-pi-password-reset', {
                    'connection': 'global',
                    'status': 'success',
                    'message': 'Password reset successful.'
                })
            else:
                self.pusherEvent.trigger(self.channel, 'petfeed-pi-password-reset', {
                    'connection': 'global',
                    'status': 'error',
                    'message': 'Password reset unsuccessful.'
                })
                print('cant reset')
        else:
            print('passed')

    def configure(self, data):
        data = ast.literal_eval(data)
        print('configuring...')
        if data['channel'] == self.channel:
            print('here')
            token = data['token']
            device = Device()
            result = self.db.selectAll(device)
            device.from_map(result[0])
            device.accessToken = token
            r = self.db.update(device)
            print(r)
            self.pusherEvent.trigger(self.channel, 'petfeed-pi-configure', {
                'connection': 'global',
                'status': 'success',
                'message': 'Device configured successful.'
            })

    def treat(self, data):
        data = ast.literal_eval(data)
        amount = data['amount']

        device = Device()
        self.db = DBController()
        results = self.db.selectAll(device)
        device.from_map(results[0])

        if device.type == 'Fish':
            self.motors.fish(duration=amount)

        self.pusherEvent.trigger(self.channel, 'petfeed-pi-treat', {
            'connection': 'global',
            'status': 'success',
            'message': 'Device configured successful.'
        })

        print(amount)

    @staticmethod
    def restart(data):
        # os.system("sudo reboot")
        print('received restart')

    @staticmethod
    def shutdown(data):
        # os.system("sudo poweroff")
        print('received shutdown')

    def test(self, data):
        print(data)
        self.pusherEvent.trigger(self.channel, 'petfeed-pi-test', {
            'connection': 'global',
            'status': 'success',
            'message': 'Device test successful.'
        })

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

                self.pusherEvent.trigger(self.channel, 'petfeed-pi-register', {
                    'connection': 'global',
                    'status': 'success',
                    'message': 'Device registered successful.'
                })

    def status(self, data):
        self.pusherEvent.trigger(self.channel, 'petfeed-pi-status', {
            'connection': 'global',
            'status': 'online',
            'message': 'Device online'
        })

    def start_hopper(self, data):
        self.motors.start()

    def stop_hopper(self, data):
        self.motors.stop()

    def connect_handler(self, data):
        petfeed_channel = self.pusherClient.subscribe(self.channel)
        petfeed_channel.bind('test', self.test)
        petfeed_channel.bind('petfeed-restart', self.restart)
        petfeed_channel.bind('petfeed-reset-password', self.password_reset)
        petfeed_channel.bind('petfeed-shutdown', self.shutdown)
        petfeed_channel.bind('petfeed-configure', self.configure)
        petfeed_channel.bind('petfeed-treat', self.treat)
        petfeed_channel.bind('petfeed-register', self.register)
        petfeed_channel.bind('petfeed-status', self.status)
        petfeed_channel.bind('petfeed-start-hopper', self.start_hopper)
        petfeed_channel.bind('petfeed-stop-hopper', self.stop_hopper)

    def connect(self):
        self.pusherClient = PusherClient.Pusher(key=creds.key, secret=creds.secret,
                                                cluster=creds.cluster)
        self.pusherClient.connection.bind(
            'pusher:connection_established', self.connect_handler)
        self.pusherClient.connect()

        self.pusherEvent = PusherEvent.Pusher(app_id=creds.app_id, key=creds.key,
                                              secret=creds.secret, cluster=creds.cluster)

        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            self.pusherClient.disconnect()

    def __del__(self):
        self.pusherClient.disconnect()
