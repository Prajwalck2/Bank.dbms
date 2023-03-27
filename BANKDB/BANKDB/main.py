from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from werkzeug.security import generate_password_hash,check_password_hash
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user

# database connection
local_server= True
app = Flask(__name__)
app.secret_key='rethick'



login_manager=LoginManager(app)
login_manager.login_view='login'

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

#app.config['SQLALCHEMY_DATABASE_URI']='mysql://username:password@localhost/databasw_table_name'
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/bms'
db=SQLAlchemy(app)



#database models


class User(UserMixin,db.Model):
    id=db.Column(db.Integer,primary_key=True)
    username=db.Column(db.String(50))
    email=db.Column(db.String(50),unique=True)
    password=db.Column(db.String(1000))

class Caccount(db.Model):
    cid=db.Column(db.Integer,primary_key=True)
    cemail=db.Column(db.String(50))
    cname=db.Column(db.String(50))
    gender=db.Column(db.String(50))
    ctoa=db.Column(db.String(20))
    cdob=db.Column(db.String)
    cib=db.Column(db.String(50))
    cphone=db.Column(db.String(12))


class Employee(db.Model):
    empid=db.Column(db.Integer,primary_key=True)
    empname=db.Column(db.String(50))
    empgender=db.Column(db.String(10))
    
    empdesg=db.Column(db.String(25))
    empaddress=db.Column(db.String(50))
    empphone=db.Column(db.String(12))
    empemail=db.Column(db.String(25))


class Accnum(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    anumber=db.Column(db.String(25))

class Adetails(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    anumber=db.Column(db.String(25))
    atype=db.Column(db.String(25))
    aname=db.Column(db.String(25))
    cemail=db.Column(db.String(25))
    agender=db.Column(db.String(25))
    adob=db.Column(db.String)
    aaddress=db.Column(db.String(50))
    aphone=db.Column(db.String(12))
    abalance=db.Column(db.Integer)

class Transaction(db.Model):
    tid=db.Column(db.Integer,primary_key=True)
    temail=db.Column(db.String(25))
    taccnum=db.Column(db.String(20))
    tdate=db.Column(db.String)
    ttime=db.Column(db.String)
    ttype=db.Column(db.String(20))
    tamount=db.Column(db.String(20))


class Adlogin(db.Model):
    adid=db.Column(db.Integer,primary_key=True)
    admail=db.Column(db.String(25))
    adpassword=db.Column(db.String(25))


class Feedback(db.Model):
    fid=db.Column(db.Integer,primary_key=True)
    femail=db.Column(db.String(25))
    fname=db.Column(db.String(25))
    ftext=db.Column(db.String(100))

@app.route('/')
def index():
    return render_template('newlogin.html')


@app.route('/adminhome')
def adminhome():
    return render_template('adminhome.html')

@app.route('/userhome')
def userhome():
    return render_template('userhome.html')

@app.route('/feedback',methods=['POST','GET'])
def feedback():
    if request.method == "POST":
        femail=request.form.get('email')
        fname=request.form.get('name')
        ftext=request.form.get('text')
        query=db.engine.execute(f"INSERT INTO `feedback` (`femail`,`fname`,`ftext`) VALUES ('{femail}','{fname}','{ftext}')")
        flash("Feedback Submitted","info")
    return render_template('feedback.html')


@app.route('/createemployee',methods=['POST','GET'])
def createemployee():
    if request.method == "POST":
        empname=request.form.get('name')
        empgender=request.form.get('gender')
        empdesg=request.form.get('desg')
        empaddress=request.form.get('address')
        empphone=request.form.get('number')
        empemail=request.form.get('email')
        query=db.engine.execute(f"INSERT INTO `employee` (`empname`,`empgender`,`empdesg`,`empaddress`,`empphone`,`empemail`) VALUES ('{empname}','{empgender}','{empdesg}','{empaddress}','{empphone}','{empemail}')")
        flash("Employee Added","info")
        return redirect('/employee')
    return render_template('createemployee.html')


@app.route('/addcustomer',methods=['POST','GET'])
def addcustomer():
    if request.method == "POST":
        anumber=request.form.get('number')
        atype=request.form.get('toa')
        aname=request.form.get('name')
        cemail=request.form.get('email')
        agender=request.form.get('gender')
        adob=request.form.get('date')
        aaddress=request.form.get('address')
        aphone=request.form.get('pnumber')
        abalance=request.form.get('bnumber')
        query=db.engine.execute(f"INSERT INTO `adetails` (`anumber`,`atype`,`aname`,`cemail`,`agender`,`adob`,`aaddress`,`aphone`,`abalance`) VALUES ('{anumber}','{atype}','{aname}','{cemail}','{agender}','{adob}','{aaddress}','{aphone}','{abalance}')")
        flash("Customer Added","info")
    return render_template('addcustomer.html')


@app.route('/addbranch',methods=['POST','GET'])
def addbranch():
    if request.method == "POST":
        name=request.form.get('name')
        bcode=request.form.get('code')
        address=request.form.get('address')
        bphone=request.form.get('pnumber')
        query=db.engine.execute(f"INSERT INTO `branch` (`name`,`bcode`,`address`,`bphone`) VALUES ('{name}','{bcode}','{address}','{bphone}')")
        flash("Branch Added","info")
        return redirect('/branch')
    return render_template('addbranch.html')
    


@app.route('/adminfeedback')
def adminfeedback():
    query=db.engine.execute(f"SELECT * FROM `feedback`")
    return render_template('adminfeedback.html',query=query)

@app.route('/employee')
def employee():
    query=db.engine.execute(f"SELECT * FROM `employee` ")

    return render_template('employee.html',query=query)

@app.route('/branch')
def branch():
    query=db.engine.execute(f"SELECT * FROM `branch` ")

    return render_template('branch.html',query=query)

@app.route('/userbranch')
def userbranch():
    query=db.engine.execute(f"SELECT * FROM `branch` ")

    return render_template('userbranch.html',query=query)

@app.route('/accountdetails',methods=['POST','GET'])
def accountdetails():
    if request.method == "POST":
        anumber=request.form.get('number')
        que=db.engine.execute(f"SELECT * FROM `adetails` WHERE anumber='{anumber}'")
        #flash("Request Accepted","danger")
        return render_template('accountdetails.html',que=que)
    
    #flash("Request Accepted","danger")    
    return render_template('accountdetails.html')
    


@app.route('/transactiondetails',methods=['POST','GET'])

def transactiondetails():
    if request.method == "POST":
        anumber=request.form.get('number')
        que=db.engine.execute(f"SELECT * FROM `transaction` WHERE taccnum='{anumber}'")
        return render_template('transactiondetails.html',que=que)
        
    return render_template('transactiondetails.html')



@app.route('/newlogin')

def newlogin():
    

    return render_template('newlogin.html')


@app.route('/adminlogin',methods=['POST','GET'])
def adminlogin():
    if request.method == "POST":
        
        admail=request.form.get('email')
        adpassword=request.form.get('password')
        adlogin=Adlogin.query.filter_by(admail=admail).first()
        adlog=Adlogin.query.filter_by(adpassword=adpassword).first()
        if adlogin and adlog:
            #login_user(adlogin)
            flash("LOGIN SUCCESSFULL","success")
            return render_template('adminhome.html')
        else:
            flash("Invalid Credentials","danger")
            return render_template('adminlogin.html')
    return render_template('adminlogin.html')
    

    
        
    


    
    
    

        
    



@app.route('/requests')
@login_required
def requests():
    em=current_user.email
    query=db.engine.execute(f"SELECT * FROM `caccount` WHERE cemail='{em}'")
    return render_template('requests.html',query=query)


@app.route('/useraccountdetails')
@login_required
def useraccountdetails():
    em=current_user.email
    query=db.engine.execute(f"SELECT * FROM `adetails` WHERE cemail='{em}'")
    return render_template('useraccountdetails.html',query=query)


@app.route('/usertransactiondetails')
@login_required
def usertransactiondetails():
    em=current_user.email
    que=db.engine.execute(f"SELECT * FROM `transaction` WHERE temail='{em}'")
    return render_template('usertransactiondetails.html',que=que)

@app.route("/edit/<string:cid>",methods=['POST','GET'])
@login_required
def edit(cid):
    posts=Caccount.query.filter_by(cid=cid).first()
    if request.method == "POST":
        cemail=request.form.get('email')
        cname=request.form.get('name')
        gender=request.form.get('gender')
        ctoa=request.form.get('slot')
        cdob=request.form.get('date')
        cib=request.form.get('branch')
        cphone=request.form.get('number')
        db.engine.execute(f"UPDATE `caccount` SET `cemail` = '{cemail}', `cname` = '{cname}', `gender` = '{gender}', `ctoa` = '{ctoa}', `cdob` = '{cdob}', `cib` = '{cib}', `cphone` = '{cphone}' WHERE `caccount`.`cid` = {cid}")
        flash("Details Updated","success")
        return redirect('/requests')

    return render_template('edit.html',posts=posts)



@app.route("/delete/<string:empid>",methods=['POST','GET'])

def delete(empid):
    db.engine.execute(f"DELETE FROM `employee` WHERE `employee`.`empid`={empid}")
    flash("Request Deleted Successfull","danger")
    return redirect('/employee')


@app.route("/admindelete/<string:id>",methods=['POST','GET'])

def admindelete(id):
    db.engine.execute(f"DELETE FROM `branch` WHERE `branch`.`id`={id}")
    flash("Request Deleted Successfull","danger")
    return redirect('/branch')




@app.route('/signup',methods=['POST','GET'])
def signup():
    if request.method == "POST":
        username=request.form.get('username')
        email=request.form.get('email')
        password=request.form.get('password')
        user=User.query.filter_by(email=email).first()
        if user:
            flash("Email Already Exists","warning")
            return render_template('/signup.html')
        encpassword=generate_password_hash(password)
        new_user=db.engine.execute(f"INSERT INTO `user` (`username`,`email`,`password`) VALUES ('{username}','{email}','{encpassword}')")
        flash("Signup Success Please Login","success")
        return render_template('login.html')
    return render_template('signup.html')

@app.route('/newsignup',methods=['POST','GET'])
def newsignup():
    if request.method == "POST":
        
        email=request.form.get('email')
        password=request.form.get('password')
        
        
        #encpassword=generate_password_hash(password)
        newadmin=db.engine.execute(f"INSERT INTO `adlogin` (`admail`,`adpassword`) VALUES ('{email}','{password}')")
        flash("Signup Success Please Login","success")
        return render_template('adminbase.html')

    
    return render_template('newsignup.html')

@app.route('/login',methods=['POST','GET'])
def login():
    if request.method == "POST":
        
        email=request.form.get('email')
        password=request.form.get('password')
        user=User.query.filter_by(email=email).first()
        

        if user and check_password_hash(user.password,password):
            login_user(user)
            flash("LOGIN SUCCESSFULL","success")
            return render_template('userhome.html')
        else:
            flash("Invalid Credentials","danger")
            return render_template('login.html')
    return render_template('login.html')

@app.route('/logout')

def logout():
    #logout_user()
    flash("LOGOUT SUCCESSFULL","primary")
    return render_template('newlogin.html')


@app.route('/search',methods=['POST','GET'])

def search():
    if request.method == "POST":
        anumber=request.form.get('search')
        query=db.engine.execute(f"SELECT * FROM `employee` WHERE empdesg='{anumber}'")
        return render_template('employee.html',query=query)

        
        
    return render_template('employee.html')
    




app.run(debug=True)