# -*- coding: utf-8 -*-
"""


@author: Ali Kalbaliyev
"""

from flask import Flask,render_template

app=Flask(__name__)

@app.route("/")
def homepage():
    
    return '<h1> Flask test with Header 1 </h1>'
    #return "Flask Test"
@app.route("/secondpage")
def secondpage():
    
      return '<h1> Hello Second Page</h1>'

@app.route("/home")
def home():
    # You have to create template folder
    return render_template("home.html")

@app.route("/addvalue")
def addvalue():
    number1=50
    number2=100
    result=number1+number2
    return render_template("add.html",result=result,num1=number1,num2=number2)
app.run()