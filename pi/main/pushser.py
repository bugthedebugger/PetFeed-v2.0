import os
import pusher
from models.dbcontroller import DBController
from models.device import Device
import ast


class PusherContainer:
    channel = 'presence-pet'

    @staticmethod
    def password_reset(data):
        data = ast.literal_eval(data)
        if data['channel'] == channel:
            db = DBContoller()
            device=Device()
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

    @staticmethod
    def restart(self):
        self.os.system("sudo reboot")

    @staticmethod
    def shutdown(self):
        self.os.system("sudo poweroff")

    @staticmethod
    def connect_handler(data):
        pusher_client = pusher.Pusher(
            app_id='778757',
            key='cad1fdb3d70c39d4d373',
            secret='bd983889d79748783bef',
            cluster='ap2',
            ssl=True
        )



        petfeed_channel = pusher_client.subscribe(channel)
        petfeed_channel.bind('petfeed-restart', restart)
        petfeed_channel.bind('petfeed-reset-password', password_reset)
        petfeed_channel.bind('petfeed-shutdown', shutdown)
        petfeed_channel.bind('petfeed-configure', configure)
        petfeed_channel.bind('petfeed-treat', treat)

        pusher_client = PusherClient.Pusher(key='cad1fdb3d70c39d4d373', secret='bd983889d79748783bef')

        pusher_client.connection.bind('pusher:connection_established', connect_handler)

        pusher_client.connect()

'''
def connect_handler(data):
    petfeed_channel=pusher_client.subscribe(PusherContainer.channel)
    petfeed_channel.bind('petfeed-restart',PusherContainer.restart())
    petfeed_channel.bind('petfeed-reset-password',PusherContainer.password_reset())
    petfeed_channel.bind('petfeed-shutdown',PusherContainer.shutdown())
    petfeed_channel.bind('petfeed-configure',PusherContainer.configure())
    petfeed_channel.bind('petfeed-treat',PusherContainer.treat())
'''

