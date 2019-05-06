#! /usr/bin/python3

import pymysql
import connection
from model import Model
from device import Device


class Query:

    def __init__(self):
        self.db = pymysql.connect(
            connection.host, connection.user,
            connection.password, database=connection.database)
        self.cursor = pymysql.cursors.DictCursor(self.db)

    def insert(self, model):

        columns = model.tableName + "("
        columnCount = len(model.columnNames)
        count = 0

        for column in model.columnNames:
            count = count + 1
            if count is not columnCount:
                columns = columns + column + ", "
            else:
                columns = columns + column
        columns = columns + ")"
        count = 0

        values = ""

        mapDatas = model.to_map()

        for column in model.columnNames:
            count = count + 1
            if count is not columnCount:
                if (mapDatas[column] != None):
                    values = values + '\'' + \
                        str(mapDatas[column]) + '\'' + ', '
                else:
                    values = values + '\'None\'' + ', '
            else:
                if (mapDatas[column] != None):
                    values = values + '\'' + str(mapDatas[column]) + '\''
                else:
                    values = values + '\'None\''

        query = "INSERT INTO {} VALUES({})".format(columns, values)
        error = False
        print(query)
        try:
            self.cursor.execute(query)
            self.db.commit()
        except:
            self.db.rollback()
            error = True

        return not error

    def insertAll(self, models):
        for model in models:
            self.insert(model)

    def update(self, model):
        columnCount = len(model.columnNames)
        count = 0

        values = ""

        mapDatas = model.to_map()

        for column in model.columnNames:
            count = count + 1
            if count is not columnCount:
                if (mapDatas[column] != None):
                    values = values + column + '=' + \
                        '\'' + str(mapDatas[column]) + '\'' + ', '
                else:
                    values = values + column + '=' + '\'None\'' + ', '
            else:
                if (mapDatas[column] != None):
                    values = values + column + '=' + '\'' + str(mapDatas[column]) '\''
                else:
                    values = values + column + '=' + '\'None\''

        query = "UPDATE {} SET {} WHERE id = {}".format(
            model.tableName, values, model.id)
        error = False

        try:
            self.cursor.execute(query)
            self.db.commit()
        except:
            self.db.rollback()
            error = True

        return not error


d = Device()
d.from_map(
    {
        'deviceId': 'prayushdevice3',
        'type': 'cat',
        'typeId': 2,
        'password': 'somepasswordwillgohere',
        'accessToken': 'anotheraccesstoken'
    }
)
q = Query()
print(q.insert(d))
