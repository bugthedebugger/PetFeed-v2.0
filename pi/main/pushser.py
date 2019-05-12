import pusher
from dbcontroller import DBController
from model import device

def password_reset(data):
    data = ast.literal_eval(data)
    if data['channel']==channel:
        password=input("enter old password")
        if data['oldpassword']==password:
            npassword=input("enter new password")
            data['newpassword']=npassword
        else:
            print('password wrong')
    else:
        print('wrong channel')



def configure(data):
    


def connect_handler(data):
    channel='presence-pet'
    petfeed_channel = pusherClient.subscribe(channel)
    petfeed_channel.bind('petfeed-restart',  os.system("sudo reboot"))
    petfeed_channel.bind('petfeed-reset-password',password_reset)
    petfeed channel.bind('petfeed-shutdown',os.system("sudo poweroff"))
    petfeed channel.bind('petfeed-configure',configure)