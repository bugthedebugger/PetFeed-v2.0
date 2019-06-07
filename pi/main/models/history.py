from .model import Model


class History(Model):
    id = None
    scheduleUID = None
    fed = None
    synced = None
    tableName = 'history'
    columnNames = [
        'id',
        'schedule_uid',
        'fed',
        'synced'
    ]

    def to_map(self):
        return {
            'id': self.id,
            'schedule_id': self.scheduleUID,
            'fed': self.fed,
            'synced': self.synced
        }

    def from_map(self, data_map):
        if data_map is not None:
            if 'id' not in data_map:
                self.id = None
            else:
                self.id = data_map['id']

            self.scheduleID = data_map['schedule_uid']
            self.fed = data_map['fed']
            self.synced = data_map['synced']
