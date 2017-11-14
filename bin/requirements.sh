#!/usr/bin/env bash

curl -o composer.phar https://getcomposer.org/composer.phar
php composer.phar install

curl -o selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.1.jar
#curl -o selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/3.0-beta4/selenium-server-standalone-3.0.0-beta4.jar

if [ "$(uname)" == "Darwin" ]; then
    FILE="https://chromedriver.storage.googleapis.com/2.30/chromedriver_mac64.zip"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    FILE="https://chromedriver.storage.googleapis.com/2.30/chromedriver_linux64.zip"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    FILE="https://chromedriver.storage.googleapis.com/2.30/chromedriver_win32.zip"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    FILE="https://chromedriver.storage.googleapis.com/2.30/chromedriver_win32.zip"
fi

curl -o chromedriver.zip "${FILE}"
#curl -o chromedriver.zip https://chromedriver.storage.googleapis.com/2.30/chromedriver_linux64.zip
curl -o chromedriver.zip http://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip
unzip -o chromedriver.zip && rm -f chromedriver.zip

cp tests/_data/users.yml.dist tests/_data/users.yml
