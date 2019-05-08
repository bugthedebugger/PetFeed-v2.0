from model import Model


class History(Model):
    self.id = None
    self.scheduleID = None
    self.fed = None
    self.synced = None
    tableName = 'history'
    columnNames = [
        'id',
        'schedule_id',
        'fed',
        'synced'
    ]

    def to_map(self):
        return {
            'id': self.id,
            'schedule_id': self.scheduleID,
            'fed': self.fed,
            'synced': self.synced
        }

    def from_map(self, data_map):
        if data_map is not None:
            if 'id' not in data_map:
                self.id = None
            else:
                self.id = data_map['id']

            self.scheduleID = data_map['schedule_id']
            self.fed = data_map['fed']
            self.synced = data_map['synced']
