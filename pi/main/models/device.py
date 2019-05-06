#! /usr/bin/python3

from model import Model

# class Device(Model):
#     def __init__(self):
#         self.db = pymysql.connect(
#             connection.host, connection.user,
#             connection.password, database=connection.database)
#         print(self.db)
#         self.cursor = pymysql.cursors.DictCursor(self.db)

#     def getAll(self):
#         query = "SELECT deviceId, password, accessToken, type, typeId FROM device"
#         self.cursor.execute(query)
#         result = self.cursor.fetchone()

#         if result is not None:
#             pass

#     def getToken(self):
#         query = "SELECT accessToken FROM device"
#         self.cursor.execute(query)
#         result = self.cursor.fetchone()
#         if result is not None:
#             return result[0]
#         else:
#             return None

#     def getDeviceId(self):
#         query = "SELECT deviceId FROM device"
#         self.cursor.execute(query)
#         result = self.cursor.fetchone()
#         if result is not None:
#             return result[0]
#         else:
#             return None

#     def create(self, deviceId, type, typeId, password=None, accessToken=None):
#         assert(deviceId is not None)
#         assert(type is not None)
#         assert(typeId is not None)

#         query = """
#             INSERT INTO device(deviceId, type, typeId, password, accessToken)
#             VALUES(
#                 '{}',
#                 '{}',
#                 {},
#                 '{}',
#                 '{}'
#             )
#             """.format(deviceId, type, typeId, password, accessToken)

#         error = False

#         try:
#             self.cursor.execute(query)
#             self.db.commit()
#         except:
#             self.db.rollback()
#             error = True

#         return not error

#     def update(self, deviceId, type=None, typeId=None, password=None, accessToken=None):
#         pass


# d = Device()
# d.getAll()


class Device(Model):
    id = None
    deviceId = None
    type = None
    typeId = None
    password = None
    accessToken = None
    tableName = 'device'
    columnNames = [
        'deviceId',
        'type',
        'typeId',
        'password',
        'accessToken'
    ]

    def to_map(self):
        return {
            'id': self.id,
            'deviceId': self.deviceId,
            'type': self.type,
            'typeId': self.typeId,
            'password': self.password,
            'accessToken': self.accessToken,
        }

    def from_map(self, data_map):
        if data_map is not None:

            if 'id' not in data_map:
                self.id = None
            else:
                self.id = data_map['id']

            self.deviceId = data_map['deviceId']
            self.type = data_map['type']
            self.typeId = data_map['typeId']
            self.password = data_map['password']
            self.accessToken = data_map['accessToken']
