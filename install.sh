#/bine/bash

echo "Updating..."
sudo apt-get update

echo "Installing..."
sudo apt-get -y install python3-setuptools python3-dev build-essential

sudo apt-get -y install git

sudo apt-get -y install libpq-dev

sudo easy_install3 pip

echo "Installing python packages"
sudo pip install virtualenv
sudo pip install virtualenvwrapper 
sudo pip install psycopg2
