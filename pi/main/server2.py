
import pusher
from flask import Flask
from flask import request
from flask import jsonify
from flask import copy_current_request_context
import pymysql.cursors


class Flask_server():
    app = Flask(__name__)
    request_error={
        'connection':'local',
        'status':'online',
        'message':'error request type'
    }

    @app.route('/', methods=['GET', 'POST'])
    def home(self):
        self.response = {
            'status': 'online',
            'connection': 'local'
        }
        if request.method == 'GET' or request.method == 'POST':
            return jsonify(self.response)

    # FEEDING ROUTE


    @app.route('/feed', methods=['GET', 'POST'])
    def feed(self):
        if request.method == 'GET' or request.method == 'POST':
            # device feed() #not yet completed
            self.response = {
                'connection': 'local',
                'status': 'success',
                'message': 'fed successfully'
            }

            return jsonify(self.response)

        else:
            response = self.request_error
            return jsonify(self.response)

    # USER SETUP
    @app.route('/set/user', methods=['GET', 'POST'])
    def setupUser(self):
        if request.method == 'GET':
            self.email = request.args.get('email')
            if self.email is None:
                return {
                    'status': 'error',
                    'message': 'email field is required'
                }

        elif request.method == 'POST':

            self.email = request.form['email']
            if self.email is None:
                return {
                    'status': 'error',
                    'message': 'email field is required'
                }

        else:
            response = self.request_error
            return jsonify(self.response)

        with connection.cursor as cursor:
            try:
                query = "DROP FROM users"
                cursor.execute(query)

                query = "DROP FROM schedules"
                cursor.execute(query)

                query = "INSERT INTO users(email) VALUES('%s')"
                cursor.execute(query, email)
                connection.commit()

                response = {
                    'connection': 'local',
                    'status': 'success',
                    'message': 'user has been registered'
                }

                return jsonify(response)

            except:
                connection.rollback()
                response = {
                    'connection': 'local',
                    'status': 'error',
                    'message': 'there was an error registering the user'
                }

        @app.route('/restart')
        def restart(self):
            self.os.system("sudo reboot")

        @app.route('shutdown')
        def shutdown(self):
            self.os.system("sudo poweroff")

        self.app.run()






