FROM resin/rpi-raspbian:wheezy-2015-01-15

# Install Python.
RUN apt-get update
RUN apt-get install -y python python-dev python-pip git libraspberrypi-bin python-smbus 

#add all the files in the root directory into the /app directory in the container
ADD . /app

#
CMD modprobe i2c-dev && python /app/demo.py
