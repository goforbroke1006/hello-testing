#!/usr/bin/env bash

WEBDRIVER_CDN="https://chromedriver.storage.googleapis.com"
WEBDRIVER_VERSION="2.33"
WEBDRIVER_FILE="chromedriver"

curl -o composer.phar https://getcomposer.org/composer.phar
php composer.phar install

curl -o selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.1.jar

WEBDRIVER_URL="${WEBDRIVER_CDN}/${WEBDRIVER_VERSION}/${WEBDRIVER_FILE}"
if [ "$(uname)" == "Darwin" ]; then
    WEBDRIVER_URL="${WEBDRIVER_URL}_mac64.zip"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    WEBDRIVER_URL="${WEBDRIVER_URL}_linux64.zip"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    WEBDRIVER_URL="${WEBDRIVER_URL}_win32.zip"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    WEBDRIVER_URL="${WEBDRIVER_URL}_win32.zip"
fi

curl -o chromedriver.zip "${WEBDRIVER_URL}"
unzip -o chromedriver.zip && rm -f chromedriver.zip

if [ ! -f ./tests/_data/users.yml ]; then
    cp ./tests/_data/users.yml.dist ./tests/_data/users.yml
fi
if [ ! -f ./codeception.yml ]; then
    cp ./codeception.yml.dist ./codeception.yml
fi
