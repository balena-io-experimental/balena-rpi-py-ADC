###Analog input for the raspberry pi using the ADS1x15

One of the most common things people want to do is read analog signals from their sensors using the raspberry pi. Unfortunately the pi doesn't have a native analog-to-digital converter (ADC). Luckily there is an awesome family of chips called the ADS1x15 that can help us get analog input using I2C protocol bus. 

All the supporting libs for driving the I2C bus and the ADS1x15 board was borrowed from the Adafruit raspberry pi python repo [link][4]

##what you'll need

1. [raspberry pi][1] with wifi or ethernet connection
2. an ADS1015 (12-bit) or ADS1115 (16-bit) depending on what level of accuracy you are in the market for. Adafruit has a nice breakout board [here][2]
3. a breadboard, a couple of pieces of wire
4. you might also want a [pi-cobbler][3], it makes connecting things to the pi way easier.
5. and lastly any cool analog sensor you want to read from.

##wiring it all up

connect the pins up like this:
- ADS1x15 VDD pin -> RPI 3v3 Power pin
- ADS1x15 SCL pin -> RPI GPIO 1 (SCL)
- DS1x15 SDA pin -> RPI GPIO 0 (SDA)
- ADS1x15 ADDR pin -> any RPI GND pin
- ADS1x15 GND -> any RPI GND pin

## Resin.io Setup & Deployment

1. If you haven't got a resin.io alpha account, visit [alpha.resin.io](http://alpha.resin.io) and sign up.
1. start a new applicaton on resin.io, name it something cool, download the .zip file and extract the contents of it to your SD card. 
1. Insert the SD card into the Raspberry pi, connect the ethernet cable and power it up using the micro-usb cable.
1. After about 7 minutes your new device should show up on the resin.io applications dashboard and you are ready to start pushing code updates.
1. if you haven't already, you can now clone this repository locally:

`$ git clone https://github.com/shaunmulligan/resin_rpi_py_analog.git`

then add the resin remote: (replacing <myUserName> and <myApplicationName> with yours from the resin.io dashboard) note: avoid having to type this by simply clicking the little clipboard at the top right of the resin application dashboard.

`$ git remote add resin git@git.staging.resin.io:<myUserName>/<myApplicationName>.git`

and finally push the code to your raspberry pi:

`$ git push resin master`

After the push succeeds, you should see our friendly unicorn appear in your terminal. You will also see on the dashboard that your pi's have started downloading the new code.

Go check out the logs for your raspberry pi by clicking on one of your pis in the dashboard and then selecting the logs tab.

> note: on first pushing this code to resin, you will get an error on the logs saying something like 
>     IOError: [Errno 2] No such file or directory
> The error will look like this: 
> ![Circuit diagram](/images/modprobe_error.png)
> 
> Don't worry, this is just because the modprobe to enable i2c has not loaded yet. You will need to go to your application dashboard on alpha.resin.io and restart the application, this is done in the actions tab for the application.
> Once the application restarts, you will see the ADC function as advertised.

When the app restarts, you will see meta logs and 4 voltage readings for your 4 channels on the ADS1x15 chip:

```[system] Killing application registry.resin.io/myresinapp/f8eb05d439f66eedce34ec741ecf9864da561193
[system] Installing application registry.resin.io/myresinapp/8f2e52dfbc928bebca0519691dd11759d0cf0996
[system] Starting application registry.resin.io/myresinapp/8f2e52dfbc928bebca0519691dd11759d0cf0996
A0 = 3.293375 V
A1 = 0.000000 V
A2 = 3.293250 V
A3 = 0.000000 V
```

From here you should be able to do all kinds of cool things. Also be sure to check out the different modes and config for the ADS1x15 chip, it is possible to run it as a 2 channel differential ADC and in a comparator mode.

[1]:http://www.raspberrypi.org/
[2]:http://www.adafruit.com/product/1085
[3]:http://www.adafruit.com/product/1105
[4]:https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code