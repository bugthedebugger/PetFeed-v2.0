
import os

from flask import Flask
from flask import jsonify
from flask import request
from flask import status
from models.model import Model
from hw_controllers.motor_controller import MotorController
from models.device import Device
from models.dbcontroller import DBController


motors = MotorController()
db = DBController()
request_method_error = {
    'connection': 'local',
    'status': 'error',
    'message': 'Error request type.'
}


class FlaskServer:

    app = Flask(__name__)
    request_error = {
        'connection': 'local',
        'status': 'online',
        'message': 'error request type'
    }

    @app.route('/', methods=['POST'])
    def home():
        response = {
            'status': 'online',
            'connection': 'local'
        }
        if request.method == 'POST':
            return jsonify(response)

    # FEEDING ROUTE
    @app.route('/feed', methods=['POST'])
    def feed():
        if request.method == 'POST':

            userRequest = request.get_json(force=True)
            userToken = userRequest['accessToken']

            devices = db.selectAll(Device())
            device = devices[0]
            accessToken = device.accessToken

            if userToken == accessToken:
                amount = userRequest['amount']

                if device.type == 'Fish':
                    motors.fish(duration=amount)

                response = {
                    'connection': 'local',
                    'status': 'success',
                    'message': 'fed successfully'
                }

            return jsonify(response)

        else:
            response = request_error
            return jsonify(response)

    @app.route('/start-hopper')
    def startHopper():
        if request.method == 'GET' or request.method == 'POST':
            motors.start()
            response = {
                'connection': 'local',
                'status': 'success',
                'message': 'hopper started'
            }

    @app.route('/stop-hopper')
    def stopHopper():
        if request.method == 'GET' or request.method == 'POST':
            motors.stop()
            response = {
                'connection': 'local',
                'status': 'success',
                'message': 'hopper stopped'
            }

    @app.route('/restart')
    def restart():
        os.system("sudo reboot")

    @app.route('/shutdown')
    def shutdown():
        os.system("sudo poweroff")

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
                return jsonify({
                    'connection': 'local',
                    'status': 'error',
                    'id': None
                }), status.HTTP_401_UNAUTHORIZED

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

    def start(self):
        self.app.run(host='0.0.0.0', port=8848, debug=True)

    def fish(self):
        motors.fish()
