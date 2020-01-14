from flask import Flask

app = Flask(__name__)

@app.route('/')
def get_image():
    html = '<html><img src="/return/mafile.jpg"></img></html>'
    return html