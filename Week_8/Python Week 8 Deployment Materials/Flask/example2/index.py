# -*- coding: utf-8 -*-
"""


@author: Ali Kalbaliyev
"""

from flask import Flask,render_template

app=Flask(__name__)
@app.route("/")
def homepage():
    newTitle='Machine Learning Application'
    #return '<h1> Flask test with Header 1 </h1>'
    return render_template("index.html",title=newTitle)

app.run()
