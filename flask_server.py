from flask import Flask, render_template, redirect, jsonify, request, url_for, session
import pymysql

class DbMan(object):
    def __init__(self, db_name,  ):
        self.connection =pymysql.connect( 
            host='localhost',
            db = db_name, 
            user = 'root', 
            password = '',
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
    def __del__(self):
        self.connection.close()
    def exec_raw(self, sql):
        try:
            with self.connection.cursor() as cursor:
                cursor.execute(sql)
                return cursor.fetchall()

        except Exception as e:
            print(e.__dict__)
    def soldiers_count(self):
        return self.exec_raw('select count(*) from soldier;')[0]['count(*)']
    def officers_count(self):
        return self.exec_raw('select count(*) from officer;')[0]['count(*)']
    def rations_count(self):
        return self.exec_raw('select count(*) from rations;')[0]['count(*)']
    def weapons_count(self):
        return self.exec_raw('select count(*) from equipment;')[0]['count(*)']
    def rations(self):
        return self.exec_raw('select name , quantity from rations;')
    




app = Flask(__name__)
manager = DbMan('test')


@app.route("/")
def index():
    soldiers = manager.soldiers_count()
    officers = manager.officers_count()
    rations = manager.rations_count()
    weapons = manager.weapons_count()
    rations_details = manager.rations()
    print(locals(), soldiers)
    return render_template('home.html', **locals())

@app.route('/weaponry' , methods = ['GET', 'POST'])
def weaponry():
    return ' yah it will be here soon'

if __name__ == '__main__':
    app.run(host = '0.0.0.0' , port=5000 , debug=True )