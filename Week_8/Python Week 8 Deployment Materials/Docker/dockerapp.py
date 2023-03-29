from flask import Flask

app=Flask(__name__)

@app.route('/')
def hellodocker():
    return "Flask said Hello to Docker"
    
if __name__=='__main__':
    app.run(debug=True,host='0.0.0.0')