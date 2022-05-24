#!pip install flask
from flask import Flask

# Intialization of Flask
app = Flask(__name__)# It takes care of your dir structure to render Html pages and css from specific folder

@app.route("/") # It binds the wrbiste url with below fuction 
def hello():
    return "Hello Everyone"

if __name__=="__main__":
    app.run()

    