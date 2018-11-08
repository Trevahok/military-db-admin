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
    def _exec_raw_sql(self, sql , *args, **kwargs):
        try:
            with self.connection.cursor() as cursor:
                print(sql.format(*args))
                sql = sql.format(*args)
                cursor.execute(sql)
                result = cursor.fetchall()
                print(result)
                self.connection.commit()
                return result
        except Exception as e:
            print(e.__dict__)
  
    def soldiers_count(self):
        return self._exec_raw_sql('select count(*) from soldier;')[0]['count(*)']
    def barracks_capacity(self):
        return self._exec_raw_sql('select (b/a) *100  count from (select sum(capacity)a from barracks ) a  , (select sum(c) b from ( select count(soldier_id) c from soldier group by b_id) temp) b;')[0]['count']
    def officers_count(self):
        return self._exec_raw_sql('select count(*) from officer;')[0]['count(*)']
    def rations_count(self):
        return self._exec_raw_sql('select count(*) from rations;')[0]['count(*)']
    def weapons_count(self):
        return self._exec_raw_sql('select count(*) from equipment;')[0]['count(*)']
    def rations_details(self):
        return self._exec_raw_sql('select * from rations;')
    def soldiers_details(self):
        return self._exec_raw_sql('select soldier_id, firstname , lastname, soldier_rank  from soldier;')
    def armors(self):
        return self._exec_raw_sql('select * from armor;')
    def weapons(self):
        return self._exec_raw_sql('select * from weapon join equipment on weapon.serial_no=equipment.serial_no;')

    def add_weapon(self, name , type , firing_rate, reload_time, damage , serial_no, weight, required_licence, types):
        self._exec_raw_sql("insert into equipment values({},{},'{}','{}');".format(serial_no[0], weight[0], required_licence[0], types[0]))
        return self._exec_raw_sql("insert into weapon values('{}' ,'{}', {} , {} , {} , {});".format(name[0] , type[0] , reload_time[0], firing_rate[0], damage[0], serial_no[0]))
    def add_ration(self, name , quantity):
        return self._exec_raw_sql("insert into rations values({},'{}','{}',{},'{}')")
    def promoting_soldier(self, soldier_rank, soldier_id):
        return self._exec_raw_sql("update soldier set soldier_rank='{}' where soldier_id={}",soldier_rank,soldier_id)
    def soldiers_taking_new_courses(self, course_id, soldier_id):
        return self._exec_raw_sql("insert into soldiers_courses values({},{})".format(course_id,soldier_id))
    def dropout_courses(self, course_id, soldier_id):
        return self._exec_raw_sql("delete from soldiers_courses where course_id={} and soldier_id={};")
    def soldiers_moving_to_new_barrack(self, soldier_id, b_id):
        return self._exec_raw_sql("insert into soldier_in_barrack values({},{});".format(soldier_id,b_id))
    def barrack_getting_new_incharge(self, name, b_id):
        return self._exec_raw_sql("update barracks set name={} where b_id={};",name,b_id)
    def officer_buying_new_vehicle(self, vehicle_reg_no, officer_id):
        return self._exec_raw_sql("update officer set vehicle_reg_no={} where officer_id={};",vehicle_reg_no,officer_id)
    def removing_old_armory(self, armoury_no):
        return self._exec_raw_sql("delete from armory where armoury_no='{}';",armoury_no)
    def updating_licence_for_equipment(self, required_licence, serial_no):
        return self._exec_raw_sql("update equipment set required_licence='{}' where serial_no='{}';",required_licence,serial_no)
    def recruitment_of_engineer(self, name, speciality, officer_id, personal_number, officer_rank, vehicle_reg_no, soldier_id):
        self._exec_raw_sql("insert into officer values({},'{}',{},'{}',{},{})".format(officer_id, name, personal_number, officer_rank, vehicle_reg_no, soldier_id))
        self._exec_raw_sql("insert into engineer values('{}','{}',{});".format(name, speciality, officer_id))
    def updating_armory_with_security_clearance(self, armoury_no, required_security_clearance):
        return self._exec_raw_sql("update armory set required_security_clearance='{}' where armoury_no='%s';",required_security_clearance,armoury_no)
    def adding_new_maintainer_for_barracks(self, emp_id, b_id, emp_type):
        self._exec_raw_sql("insert into maintainer values({},'{}')".format(emp_id, emp_type)); 
        self._exec_raw_sql("insert into barrack_maintainer values({},{});".format(emp_id, b_id))

   

app = Flask(__name__)
manager = DbMan('test')

soldiers_count = manager.soldiers_count()
officers_count = manager.officers_count()
rations = manager.rations_count()
weapons = manager.weapons_count()

@app.route("/")
def index():
    rations_details = manager.rations_details()
    if request.method == 'POST':
        manager.add_weapon(**request.form)
    return render_template('home.html', **locals() , **globals()) 

@app.route('/weaponry' , methods = ['GET', 'POST'])
def weaponry():
    armor_details = manager.armors()
    weapon_details = manager.weapons()
    if request.method == 'POST':
        manager.add_weapon(**request.form)
        print(request.form)
    return render_template('weaponry.html', **locals(), **globals())

@app.route('/officers')
def officers():
    return render_template('officer.html', **globals())

@app.route('/soldiers')
def soldiers():
    return render_template('soldier.html', **globals()) 
if __name__ == '__main__':
    app.run(host = '0.0.0.0' , port=5000 , debug=True )
