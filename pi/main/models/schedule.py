from .model import Model


class Schedule(Model):
    id = None
    day = None
    time = None
    amount = None
    groupId = None
    petId = None
    synced = None
    uploaded = None
    deleted = None
    uId = None
    tableName = 'schedule'
    serverId = None
    columnNames = [
        'id',
        'day',
        'feedTime',
        'amount',
        'groupId',
        'petId',
        'synced',
        'uploaded',
        'deleted',
        'uId',
        'serverId'
    ]

    def to_map(self):
        return {
            'id': self.id,
            'day': self.day,
            'feedTime': self.time,
            'amount': self.amount,
            'synced': self.synced,
            'groupId': self.groupId,
            'petId': self.petId,
            'uploaded': self.uploaded,
            'deleted': self.deleted,
            'uId': self.uId,
            'serverId': self.serverId
        }

    def from_map(self, data_map):
        if data_map is not None:

            if 'id' not in data_map:
                self.id = None
            else:
                self.id = data_map['id']

            self.day = data_map['day']
            self.time = data_map['feedTime']
            self.amount = data_map['amount']
            self.synced = 1 if data_map['synced'] else 0
            self.groupId = data_map['groupId']
            self.petId = data_map['petId']
            self.uploaded = 1 if data_map['uploaded'] else 0
            self.deleted = 1 if data_map['deleted'] else 0
            self.uId = data_map['uId']
            self.serverId = data_map['serverId']
