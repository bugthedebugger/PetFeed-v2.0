#! /usr/bin/python3

from model import Model


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
