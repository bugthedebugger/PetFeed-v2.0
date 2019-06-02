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

    def __init__(self, motorController, distanceSensor):
        device = Device()
        self.db = DBController()
        results = self.db.selectAll(device)
        device.from_map(results[0])
        self.channel = 'private-' + device.deviceId
        self.motors = motorController
        self.distanceSensor = distanceSensor

    def password_reset(self, data):
        data = ast.literal_eval(data)

        print(data)

        device = Device()
        result = self.db.selectAll(device)
        device.from_map(result[0])
        # print(data['oldPassword'])
        # print(device.password)
        # print(data['newPassword'])
        # print(device.password == data['oldPassword'])
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

    def configure(self, data):
        data = ast.literal_eval(data)
        # print('configuring...')
        # print(data['channel'])
        # print(self.channel)
        token = data['token']
        device = Device()
        result = self.db.selectAll(device)
        device.from_map(result[0])
        device.accessToken = token
        r = self.db.update(device)
        # print(r)
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

        if data['accessToken'] == device.accessToken:
            if self.distanceSensor.fish() > 5:
                if device.type == 'Fish':
                    self.motors.fish(duration=amount)
                else:
                    self.motors.wtFeed(amount=amount)

                self.pusherEvent.trigger(self.channel, 'petfeed-pi-treat', {
                    'connection': 'global',
                    'status': 'success',
                    'message': 'Treat success.'
                })
            else:
                self.pusherEvent.trigger(self.channel, 'petfeed-pi-treat', {
                    'connection': 'global',
                    'status': 'error',
                    'message': 'Low food'
                })

            self.foodMeter()
        else:
            print('access token mismatch')

        print(amount)

    def restart(self, data):
        data = ast.literal_eval(data)

        device = Device()
        results = self.db.selectAll(device)
        device.from_map(results[0])

        if data['accessToken'] == device.accessToken:
            print('received restart')
        else:
            print('access token mismatch')

    def shutdown(self, data):
        data = ast.literal_eval(data)

        device = Device()
        results = self.db.selectAll(device)
        device.from_map(results[0])

        if data['accessToken'] == device.accessToken:
            print('received shutdown')
        else:
            print('access token mismatch')

    def test(self, data):
        print(data)
        self.pusherEvent.trigger(self.channel, 'petfeed-pi-test', {
            'connection': 'global',
            'status': 'success',
            'message': 'Device test successful.'
        })

    def register(self, data):
        data = ast.literal_eval(data)

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
        data = ast.literal_eval(data)

        device = Device()
        results = self.db.selectAll(device)
        device.from_map(results[0])

        if data['accessToken'] == device.accessToken:
            self.motors.start()
        else:
            print('access token mismatch')

    def reverse_hopper(self, data):
        data = ast.literal_eval(data)

        device = Device()
        results = self.db.selectAll(device)
        device.from_map(results[0])

        if data['accessToken'] == device.accessToken:
            self.motors.reverse()
        else:
            print('access token mismatch')

    def stop_hopper(self, data):
        data = ast.literal_eval(data)

        device = Device()
        results = self.db.selectAll(device)
        device.from_map(results[0])

        if data['accessToken'] == device.accessToken:
            self.motors.stop()
        else:
            print('access token mismatch')

    def foodMeter(self):
        device = Device()
        results = self.db.selectAll(device)
        device.from_map(results[0])

        if device.type == 'Fish':
            self.pusherEvent.trigger(self.channel, 'petfeed-pi-food-meter', {
                'connection': 'global',
                'status': 'online',
                'amount': self.distanceSensor.fish()
            })
        else:
            self.pusherEvent.trigger(self.channel, 'petfeed-pi-food-meter', {
                'connection': 'global',
                'status': 'online',
                'amount': self.distanceSensor.other()
            })

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
        petfeed_channel.bind('petfeed-reverse-hopper', self.reverse_hopper)
        petfeed_channel.bind('petfeed-stop-hopper', self.stop_hopper)

        # CLIENT EVENTS -- WILL REMOVE REDUNDANT ONES
        petfeed_channel.bind('client-test', self.test)
        petfeed_channel.bind('client-petfeed-restart', self.restart)
        petfeed_channel.bind(
            'client-petfeed-reset-password', self.password_reset)
        petfeed_channel.bind('client-petfeed-shutdown', self.shutdown)
        petfeed_channel.bind('client-petfeed-configure', self.configure)
        petfeed_channel.bind('client-petfeed-treat', self.treat)
        petfeed_channel.bind('client-petfeed-register', self.register)
        petfeed_channel.bind('client-petfeed-status', self.status)
        petfeed_channel.bind('client-petfeed-start-hopper', self.start_hopper)
        petfeed_channel.bind('client-petfeed-stop-hopper', self.stop_hopper)

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
