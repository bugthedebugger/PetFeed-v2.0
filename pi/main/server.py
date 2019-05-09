
import os

from flask import Flask
from flask import jsonify
from flask import request
from models.model import Model
from hw_controllers.motor_controller import MotorController
from models.device import Device
from models.dbcontroller import DBController


motors = MotorController()
db = DBController()


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
    @app.route('/feed', methods=['GET', 'POST'])
    def feed():
        if request.method == 'GET' or request.method == 'POST':
            motors.fish()
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

    @app.route('/getID', methods=['GET'])
    def getID():
        if request.method == 'GET':
            password = request.args.get('password')
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
                })

    def start(self):
        self.app.run(host='0.0.0.0', port=8848, debug=True)

    def fish(self):
        motors.fish()
