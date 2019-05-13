import pusher
from models.dbcontroller import DBController
from models.device import Device
import ast

channel = 'some-channel'


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


def treat:
    data = ast.literal_eval(data)
    amount = data['amount']
    # garna banki


def connect_handler(data):

    petfeed_channel = pusherClient.subscribe(channel)
    petfeed_channel.bind('petfeed-restart',  os.system("sudo reboot"))
    petfeed_channel.bind('petfeed-reset-password', password_reset)
    petfeed channel.bind('petfeed-shutdown', os.system("sudo poweroff"))
    petfeed channel.bind('petfeed-configure', configure)
    petfeed_channel.bind('petfeed-treat', treat)
