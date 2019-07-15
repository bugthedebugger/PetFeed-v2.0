from model import Model


class User(Model):
    id = None
    name = None
    user = None
    email = None
    serverID = None
    tableName = 'user'
    columnNames = [
        'id',
        'name',
        'user',
        'email',
        'server_id'
    ]

    def to_map(self):
        return {
            'id': self.id,
            'name': self.name,
            'user': self.user,
            'email': self.email,
            'server_id': self.serverID
        }

    def from_map(self, data_map):
        if data_map is not None:
            if 'id' not in data_map:
                self.id = None
            else:
                self.id = data_map['id']

            self.name = data_map['name']
            self.user = data_map['user']
            self.email = data_map['email']
            self.serverID = data_map['server_id']
