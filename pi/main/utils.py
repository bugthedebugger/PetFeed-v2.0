import hashlib
import random
import uuid


def getID(length=16):
    id = str(uuid.uuid1).encode('utf-8')
    salt = str(random.getrandbits(256)).encode('utf-8')
    uID = hashlib.sha512(id + salt).hexdigest()
    uID = uID[:length]
    return uID
