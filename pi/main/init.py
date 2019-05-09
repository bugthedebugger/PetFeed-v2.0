from models.dbcontroller import DBController
from models.device import Device
import utils

db = DBController()
device = Device()

device.deviceId = utils.getID()
device.password = 'petfeed123'
device.typeId = -1

print(device.to_map())
result = db.insert(device)
print(result)
