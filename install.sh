#/bine/bash

echo "Updating..."
sudo apt-get update

echo "Installing..."

# essentials
sudo apt-get -y install python3-setuptools python3-dev build-essential tmux

sudo apt-get -y install git

sudo apt-get -y install libpq-dev

sudo apt-get -y install node npm

# postgresql
sudo apt-get -y install postgresql postgresql-contrib pgadmin3

# pip
sudo easy_install3 pip

echo "Installing python packages"
sudo pip install virtualenv
sudo pip install virtualenvwrapper 
sudo pip install psycopg2
sudo pip install django

