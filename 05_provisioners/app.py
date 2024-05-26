from flask import Flask
from dotenv import load_dotenv
import os

load_dotenv()
HOST = os.getenv('host')
PORT = os.getenv('port')

app = Flask(__name__)

@app.route('/')
def basic_flask_app():
    return "Hey there! Your application is working!"

if __name__ == '__main__':
    app.run(host=HOST, port=PORT)