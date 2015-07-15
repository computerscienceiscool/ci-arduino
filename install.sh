#!/usr/bin/env bash

/sbin/start-stop-daemon --start --quiet --pidfile /tmp/custom_xvfb_1.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :1 -ac -screen 0 1280x1024x16
sleep 3
export DISPLAY=:1.0
wget http://downloads.arduino.cc/arduino-1.6.5-linux64.tar.xz
tar xf arduino-1.6.5-linux64.tar.xz
mv arduino-1.6.5 $HOME/arduino
ln -s $PWD $HOME/arduino/libraries/Adafruit_Test_Library
export PATH="$HOME/arduino:$PATH"
arduino --pref "boardsmanager.additional.urls=http://arduino.esp8266.com/package_esp8266com_index.json" --save-prefs
arduino --install-boards arduino:sam > /dev/null
arduino --install-boards esp8266:esp8266 > /dev/null