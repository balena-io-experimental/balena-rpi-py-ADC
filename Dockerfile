FROM resin/rpi-buildstep-armv6hf:latest

# Install Python.
RUN apt-get update
RUN apt-get install -y python python-dev python-pip git libraspberrypi-bin

ADD . /app

CMD ["python", "/app/demo.py"]