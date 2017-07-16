#!/usr/bin/env bash

SELENIUM="selenium-server-standalone.jar"
PORT=4444

check_selenium_start () {
    while ! nc -z localhost $PORT; do
        sleep 0.5
    done
}

java -jar $SELENIUM start -Dwebdriver.chrome.driver=./chromedriver > /dev/null & \
    (check_selenium_start && vendor/bin/codecept run --steps)

pid=$(ps -ax | grep $SELENIUM | grep -v ' grep ' | awk '{print $1}')
if [ ! -z "$pid" ]; then
    kill -9 $pid
fi