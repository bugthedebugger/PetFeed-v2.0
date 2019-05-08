from model import Model


class Schedule(Model):
    id = None
    day = None
    time = None
    amount = None
    synced = None
    tableName = 'schedule'
    columnNames = [
        'id',
        'day',
        'feedTime',
        'amount',
        'synced'
    ]

    def to_map(self):
        return {
            'id': self.id,
            'day': self.day,
            'feedTime': self.time,
            'amount': self.amount,
            'synced': self.synced
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
            self.synced = data_map['synced']
