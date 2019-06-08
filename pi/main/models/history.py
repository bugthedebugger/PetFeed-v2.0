from .model import Model
from datetime import datetime


class History(Model):
    id = None
    scheduleUID = None
    fed = None
    synced = None
    amount = None
    feedDateTime = None
    tableName = 'history'
    columnNames = [
        'id',
        'schedule_uid',
        'fed',
        'synced',
        'amount',
        'feedDateTime'
    ]

    def to_map(self):
        return {
            'id': self.id,
            'schedule_uid': self.scheduleUID,
            'fed': self.fed,
            'synced': self.synced,
            'amount': self.amount,
            'feedDateTime': self.feedDateTime
        }

    def from_map(self, data_map):
        if data_map is not None:
            if 'id' not in data_map:
                self.id = None
            else:
                self.id = data_map['id']

            if 'schedule_uid' not in data_map:
                self.scheduleUID = None
            else:
                self.scheduleUID = data_map['schedule_uid']

            self.fed = data_map['fed']
            self.synced = data_map['synced']
            self.amount = data_map['amount']
            self.feedDateTime = datetime.now()
