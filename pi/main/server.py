
import os

from flask import Flask
from flask import jsonify
from flask import request
# from hw_controllers.motor_controller import MotorController
from models.device import Device
from models.history import History
from models.dbcontroller import DBController
from models.schedule import Schedule
import utils
from datetime import datetime


# motors = MotorController()

request_method_error = {
    'connection': 'local',
    'status': 'error',
    'message': 'Error request type.'
}
unauthenticated_response = {
    'connection': 'local',
    'status': 'error',
    'message': 'Unauthenticated'
}
food_low_response = {
    'connection': 'local',
    'status': 'error',
    'message': 'fed successfully',
    'remaining': 80
}


motors = None
distanceSensor = None
db = None


class FlaskServer:

    def __init__(self, motorController, _distanceSensor, _dbController):
        global motors
        motors = motorController
        global distanceSensor
        distanceSensor = _distanceSensor
        global db
        db = _dbController

    app = Flask(__name__)
    request_error = {
        'connection': 'local',
        'status': 'online',
        'message': 'error request type'
    }

    @app.route('/', methods=['POST'])
    def home():
        history = History()
        results = db.selectAll(history)
        feedCount = 0
        for result in results:
            history.from_map(result)
            print('Direct DateTime:')
            print(history.feedDateTime)
            print('History Date:')
            print(history.feedDateTime.date())
            print('System Date:')
            print(datetime.today().date())
            if history.feedDateTime.date() == datetime.today().date():
                feedCount = feedCount + 1

        response = {
            'status': 'online',
            'connection': 'local',
            'remaining': distanceSensor.fish(),
            'feedCount': feedCount
        }
        if request.method == 'POST':
            return jsonify(response)

    # FEEDING ROUTE
    @app.route('/feed', methods=['POST'])
    def feed():
        if request.method == 'POST':

            userRequest = request.get_json(force=True)
            userToken = userRequest['accessToken']

            device = Device()
            devices = db.selectAll(device)
            device.from_map(devices[0])
            accessToken = device.accessToken

            # print(userToken)
            # print(accessToken)

            if userToken == accessToken:
                amount = userRequest['amount']

                print('------------------------------------------')
                print('Food Distance: ', str(distanceSensor.fish()))
                print('------------------------------------------')

                if distanceSensor.fish() > 10:
                    if device.type == 'Fish':
                        # print('here')
                        motors.fish(duration=amount)
                    else:
                        motors.wtFeed(amount=amount)
                        # print('not here')
                    history = History()
                    history.from_map({
                        'fed': 1,
                        'synced': 0,
                        'amount': amount
                    })
                    result = db.insert(history)
                    print('Insert History: ', str(result))
                    results = db.selectAll(history)
                    feedCount = 0
                    for result in results:
                        history.from_map(result)
                        print(history.feedDateTime)
                        if history.feedDateTime.date() == datetime.today().date():
                            feedCount = feedCount + 1

                    print('Feed Count: ', str(feedCount))

                    response = {
                        'connection': 'local',
                        'status': 'success',
                        'message': 'fed successfully',
                        'remaining': distanceSensor.fish(),
                        'feedCount': feedCount
                    }
                else:
                    response = {
                        'connection': 'local',
                        'status': 'error',
                        'message': 'food low',
                        'remaining': distanceSensor.fish()
                    }

                return jsonify(response)
            else:
                return jsonify(unauthenticated_response), 401

        else:
            response = request_method_error
            return jsonify(response)

    @app.route('/start-hopper', methods=['POST'])
    def startHopper():
        if request.method == 'POST':
            device = Device()
            results = db.selectAll(device)
            device.from_map(results[0])

            userToken = request.get_json()['accessToken']

            if userToken == device.accessToken:
                motors.start()
                response = {
                    'connection': 'local',
                    'status': 'success',
                    'message': 'hopper started'
                }
                return jsonify(response)
            else:
                return jsonify(unauthenticated_response), 401

    @app.route('/stop-hopper', methods=['POST'])
    def stopHopper():
        if request.method == 'POST':
            device = Device()
            results = db.selectAll(device)
            device.from_map(results[0])

            userToken = request.get_json()['accessToken']

            if userToken == device.accessToken:
                motors.stop()
                response = {
                    'connection': 'local',
                    'status': 'success',
                    'message': 'hopper stopped'
                }
                return jsonify(response)
            else:
                return jsonify(unauthenticated_response), 401

    @app.route('/restart', methods=['POST'])
    def restart():
        if request.method == 'POST':
            device = Device()
            results = db.selectAll(device)
            device.from_map(results[0])

            userToken = request.get_json()['accessToken']

            if userToken == device.accessToken:
                os.system("sudo reboot")
            else:
                return jsonify(unauthenticated_response), 401

    @app.route('/shutdown', methods=['POST'])
    def shutdown():
        if request.method == 'POST':
            device = Device()
            results = db.selectAll(device)
            device.from_map(results[0])

            userToken = request.get_json()['accessToken']

            if userToken == device.accessToken:
                os.system("sudo poweroff")
            else:
                return jsonify(unauthenticated_response), 401

    @app.route('/getID', methods=['POST'])
    def getID():
        if request.method == 'POST':
            password = request.get_json(force=True)['password']
            d = Device()
            result = db.selectAll(Device)
            result = result[0]

            if result['password'] == password:
                return jsonify({
                    'connection': 'local',
                    'status': 'success',
                    'id': result['deviceId']
                })
            else:
                return jsonify(unauthenticated_response), 401

    @app.route('/wifisetup', methods=['POST'])
    def wifiSetup():
        # ERROR FLAG IS SET SO THAT WPA SUPPLIMENT FILE ISN'T WRITTEN DURING ERROR
        error_flag = False

        # PASSWORD FLAG IS SET TO TRUE IF PASSWORD IS EMTPY (OPEN NETWORK)
        password_flag = False

        ssid = ''
        key = ''

        if request.method == 'POST':
            data = request.get_json()
            ssid = data['ssid']
            key = data['key']

        else:
            response = request_method_error
            return jsonify(response)

        # CHECK IF SSID IS EMPTY OR NOT, IF EMPTY RETURN ERROR
        if str(ssid) == 'None' or ssid == '':
            response = {
                'connection': 'local',
                'status': 'error',
                'message': 'SSID can\'t be empty.'
            }
            error_flag = True

            return jsonify(response)

        # CHECK IF KEY IS EMPTY OR NOT, IF EMPTY SET PASSWORD FLAG TRUE
        if str(key) == 'None' or key == '':
            password_flag = False
        else:
            password_flag = True

        # IF NO ERROR OPEN THE WPA SUPPLICANT FILE AND ADD THE WIFI NETWORK
        if error_flag is False:
            # CHANGE DIRECTORY TO /etc/wpa_supplicant/ WHERE THE SUPPLIMENT FILE IS PLACED
            os.chdir('/etc/wpa_supplicant/')
            wpa_file = open("wpa_supplicant.conf", 'a')

            # IF PASSWORD IS NONE key_mgmt IS SET TO NONE
            if password_flag is True:
                new_network = """
network={
	ssid="%s"
	psk="%s"
}
				""" % (ssid, key)
            else:
                new_network = """
network={
	ssid="%s"
	key_mgmt=none
}
				""" % (ssid)

            try:
                wpa_file.write(new_network)
                wpa_file.close()

                response = {
                    'connection': 'local',
                    'status': 'success',
                    'message': 'WIFI set successfully. Please restart device.'
                }

                return jsonify(response)

            except:
                response = {
                    'connection': 'local',
                    'status': 'error',
                    'message': 'There was an error trying to add wifi.'
                }

                return jsonify(response)

    @app.route('/delete/schedules', methods=['POST'])
    def deleteSchedules():
        device = Device()
        results = db.selectAll(device)
        device.from_map(results[0])
        data = request.get_json()
        print(data)
        if device.accessToken == data['accessToken']:
            schedules_map = db.selectAll(Schedule())
            schedules = []
            schedule = Schedule()
            for s in schedules_map:
                schedule.from_map(s)
                schedule.synced = 0
                schedule.deleted = 1
                schedules.append(schedule)
                schedule = Schedule()
            deleted = db.updateAll(schedules)
            if deleted == True:
                response = {
                    'connection': 'local',
                    'status': 'success',
                    'message': 'Schedules were deleted'
                }
            else:
                response = {
                    'connection': 'local',
                    'status': 'error',
                    'message': 'There was an error trying to delete schedules'
                }

            return jsonify(response), 200
        else:
            return jsonify(unauthenticated_response), 401

    @app.route('/create/schedule', methods=['POST'])
    def createSchedule():
        device = Device()
        results = db.selectAll(device)
        device.from_map(results[0])
        data = request.get_json()
        responseSchedules = []

        if device.accessToken == data['accessToken']:

            schedules = data['schedules']
            petID = data['petId']

            for s in schedules:
                groupId = utils.getID(20)
                feedTimes = s['feedTimes']
                amount = s['amount']
                repeats = s['repeat']

                for day in repeats:
                    for feedTime in feedTimes:
                        uniqueId = utils.getID(20)
                        time = datetime.strptime(
                            feedTime, '%Y-%m-%d %H:%M:%S.%f').strftime('%H:%M:%S')
                        print(time)
                        print(int(datetime.strptime(
                            feedTime, '%Y-%m-%d %H:%M:%S.%f').strftime("%s")) * 1000)
                        schedule_map = {
                            'day': day,
                            'uId': uniqueId,
                            'feedTime': time,
                            'amount': amount,
                            'synced': False,
                            'groupId': groupId,
                            'petId': petID,
                            'uploaded': False,
                            'deleted': False,
                            'serverId': -1
                        }
                        schedule = Schedule()
                        schedule.from_map(schedule_map)
                        db.insert(schedule)
                        schedule.time = int(datetime.strptime(
                            feedTime, '%Y-%m-%d %H:%M:%S.%f').strftime("%s")) * 1000
                        responseSchedules.append(schedule.to_map())

            response = {
                'connection': 'local',
                'status': 'success',
                'message': 'Schedule(s) added successfully.',
                'schedules': responseSchedules
            }

            return jsonify(response)

        else:
            return jsonify(unauthenticated_response), 401

    def start(self):
        self.app.run(host='0.0.0.0', port=8848, debug=False)

    def fish(self):
        motors.fish()
