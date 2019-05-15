#! /usr/bin/python3

import os
# from pusher import Pusher as PusherEvent
import time

import pysher as PusherClient
from models.dbcontroller import DBController
from models.device import Device
import ast

channel = 'petfeed123'


def test(data):
    print(data)


class PusherContainer:
    pusherClient = None

    @staticmethod
    def password_reset(data):
        data = ast.literal_eval(data)
        if data['channel'] == channel:
            db = DBContoller()
            device = Device()
            result = db.selectAll(device)
            rpassword = result[0]
            if rpassword.password == data['oldpassword']:
                rpassword.password = data['newpassword']
                db.update(device)
            else:
                print('cant reset')
        else:
            pass

    @staticmethod
    def configure(data):
        data = ast.literal_eval(data)

        if data['channel'] == channel:
            Token = data['token']
            db = DBController()
            device = Device()
            result = db.selectAll(device)
            device = result[0]
            device.accessToken = Token  # yo right cha?
            db.update(device)

    @staticmethod
    def treat(data):
        data = ast.literal_eval(data)
        amount = data['amount']

        print(amount)

    @staticmethod
    def restart(data):
        os.system("sudo reboot")

    @staticmethod
    def shutdown(data):
        os.system("sudo poweroff")

    @staticmethod
    def test(data):
        print(data)

    def connect_handler(self, data):
        print('here')
        petfeed_channel = self.pusherClient.subscribe(channel)
        petfeed_channel.bind('test', self.test)
        petfeed_channel.bind('petfeed-restart', self.restart)
        petfeed_channel.bind('petfeed-reset-password', self.password_reset)
        petfeed_channel.bind('petfeed-shutdown', self.shutdown)
        petfeed_channel.bind('petfeed-configure', self.configure)
        petfeed_channel.bind('petfeed-treat', self.treat)

    def connect(self):
        self.pusherClient = PusherClient.Pusher(key='cb1bc25895d91dec8e2d', secret='fb24a8ddf38ffd23b205',
                                                cluster='ap2')
        self.pusherClient.connection.bind('pusher:connection_established', self.connect_handler)
        self.pusherClient.connect()

        while True:
            time.sleep(1)


pusherContainer = PusherContainer()
pusherContainer.connect()

'''
def connect_handler(data):
    petfeed_channel=pusher_client.subscribe(PusherContainer.channel)
    petfeed_channel.bind('petfeed-restart',PusherContainer.restart())
    petfeed_channel.bind('petfeed-reset-password',PusherContainer.password_reset())
    petfeed_channel.bind('petfeed-shutdown',PusherContainer.shutdown())
    petfeed_channel.bind('petfeed-configure',PusherContainer.configure())
    petfeed_channel.bind('petfeed-treat',PusherContainer.treat())
'''
