FROM resin/rpi-buildstep-armv6hf:latest

# Install Python.
RUN apt-get update
RUN apt-get install -y python python-dev python-pip git libraspberrypi-bin

#install python modules using pip installer
RUN pip install smbus-cffi

#add all the files in the root directory into the /app directory in the container
ADD . /app

#
CMD modprobe i2c-dev && python /app/demo.py