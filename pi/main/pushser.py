import pusher
from models.dbcontroller import DBController
from models.device import Device
import ast
import os

class Pusher_container:
    channel = 'presence-pet'
    pusher_client = pusher.Pusher(
        app_id='778756',
        key='b6afaa6cf0e2a729b965',
        secret='f9ff28d3bf908aa088b5',
        cluster='ap2',
        ssl=True
    )

    def password_reset(data):
        data = ast.literal_eval(data)
        if data['channel'] == channel:
            db = DBContoller()
            rpasssword = Device()
            result = db.selectAll(device)
            rpassword = result[0]
            if rpassword.password == data['oldpassword']:
                rpassword.password = data['newpassword']
                db.update(device)
            else:
                print('cant reset')
        else:
            pass

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

    def treat(data):
        data = ast.literal_eval(data)
        amount = data['amount']

    def restart(self):
        self.os.system("sudo reboot")

    def shutdown(self):
        self.os.system("sudo poweroff")



  def connect_handler(data):

        petfeed_channel = pusher_client.subscribe(channel)
        petfeed_channel.bind('petfeed-restart', restart)
        petfeed_channel.bind('petfeed-reset-password', password_reset)
        petfeed_channel.bind('petfeed-shutdown', shutdown)
        petfeed_channel.bind('petfeed-configure', configure)
        petfeed_channel.bind('petfeed-treat', treat)
