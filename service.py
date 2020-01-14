from flask import Flask
import subprocess

app = Flask(__name__)

@app.route('/')
def get_image():
    subprocess.call(["ffmpeg", "-sseof", "-1", "-y", "-i", "rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov", "-update", "1", "-q:v", "1", "/return/last_image.jpg"])

    html = '<html><img src="http://localhost:80/last_image.jpg"></img></html>'
    return html