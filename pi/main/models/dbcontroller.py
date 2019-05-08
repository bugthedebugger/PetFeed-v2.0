#! /usr/bin/python3

import pymysql
import connection
from model import Model


class DBController:

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
        try:
            self.cursor.execute(query)
            self.db.commit()
        except:
            self.db.rollback()
            error = True

        return not error

    def insertAll(self, models):
        error = False
        try:
            for model in models:
                self.insert(model)
        except:
            error = True

        return not error

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
                    values = values + column + '=' + \
                        '\'' + str(mapDatas[column]) + '\''
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

    def updateAll(self, models):
        error = False
        try:
            for model in models:
                self.update(model)
        except:
            error = True

        return not error

    def delete(self, model):
        query = "DELETE FROM {} WHERE id = {}".format(
            model.tableName, model.id)
        error = False

        try:
            self.cursor.execute(query)
            self.db.commit()
        except:
            self.db.rollback()
            error = True

        return not error

    def deleteAll(self, models):
        error = False
        try:
            for model in models:
                self.delete(model)
        except:
            error = True

        return not error
