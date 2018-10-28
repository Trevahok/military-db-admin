from flask import Flask, render_template, redirect, jsonify, request, url_for, session
import pymysql

class DbMan(object):
    ''' A class that interacts with the DB to return data - Custom ORM. '''
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
    def _exec_raw_sql(self, sql):
        try:
            with self.connection.cursor() as cursor:
                print(sql)
                cursor.execute(sql)
                return cursor.fetchall()
        except Exception as e:
            print(e.__dict__)

    def soldiers_count(self):
        return self._exec_raw_sql('select count(*) from soldier;')[0]['count(*)']
    def officers_count(self):
        return self._exec_raw_sql('select count(*) from officer;')[0]['count(*)']
    def rations_count(self):
        return self._exec_raw_sql('select count(*) from rations;')[0]['count(*)']
    def weapons_count(self):
        return self._exec_raw_sql('select count(*) from equipment;')[0]['count(*)']
    def rations_details(self):
        return self._exec_raw_sql('select * from rations;')
    def armors(self):
        return self._exec_raw_sql('select * from armor;')
    def weapons(self):
        return self._exec_raw_sql('select * from weapon;')
    def add_weapon(self, name , types , firing_rate, reload_time, damage , serial_no):
        return self._exec_raw_sql("insert into weapon values('{}' ,'{}', {} , {} , {} , {});".format(name[0] , types[0] , reload_time[0], firing_rate[0], damage[0], serial_no[0]))
    def add_ration(self, name , quantity):
        # return self._exec_raw_sql("insert into rations values(")
        pass
    

app = Flask(__name__)
manager = DbMan('test')


@app.route("/")
def index():
    soldiers = manager.soldiers_count()
    officers = manager.officers_count()
    rations = manager.rations_count()
    weapons = manager.weapons_count()
    rations_details = manager.rations_details()
    if request.method == 'POST':
        manager.add_weapon(**request.form)
    return render_template('home.html', **locals()) 

@app.route('/weaponry' , methods = ['GET', 'POST'])
def weaponry():
    global manager
    manag = manager
    soldiers = manager.soldiers_count()
    officers = manager.officers_count()
    rations = manager.rations_count()
    weapons = manager.weapons_count()
    armor_details = manager.armors()
    weapon_details = manager.weapons()
    if request.method == 'POST':
        manager.add_weapon(**request.form)
    return render_template('weaponry.html', **locals())

if __name__ == '__main__':
    app.run(host = '0.0.0.0' , port=5000 , debug=True )

