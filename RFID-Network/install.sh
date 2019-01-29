#!/bin/bash

# RFID-Network install script
# Ben Duggan - 12/22/18 

# Define colors used in the script
COL_DEFAULT='\033[0;37m' # Normal terminal color
COL_LG='\033[1;32m' # Step
COL_LB='\033[1;34m' # General information
COL_LR='\033[1;31m' # Danger
COL_LP='\033[1;35m' # User input

# Getting pwd
parDir=$(pwd)


echo -e "${COL_LB}Starting installation (this will take a while)... ${COL_DEFAULT}"
echo -e "${COL_LB}For recomended install type y (yes) when ever asked (Y/n) ${COL_DEFAULT}"

# ====== Step 2 ======
echo -e "${COL_LG}Starting step 2: changing RPi username, updating RPi and editing config file ${COL_DEFAULT}"
# Change the password
echo -e "${COL_LB}It is recommended that you change the password${COL_DEFAULT}"
echo -e "${COL_LB}Do you want to change the password? [Y/n] ${COL_LP}"
read yn
case $yn in
	[Yy]* ) sudo passwd;;
	[Nn]* ) echo -e "${COL_LR}It is not recommended to leave the default password ${COL_DEFAULT}";;
esac

# Need to get admin username and password (mainly for mysql) and system password (mysql)
echo -e "${COL_LB}Please enter the admin username you'd like to use for the database and server. ${COL_LP}"
read adminuser
echo -e "${COL_LB}Please enter the admin passowrd you'd like to use for the database and server. ${COL_LP}"
read adminpass
echo -e "${COL_LB}Please enter the Raspberry Pi password (needed for database config). ${COL_LP}"
read userpass

cd RFID-Network

echo -e "${COL_LB}Granting priveleges to items in server folder${COL_DEFAULT}"

cd server

echo -e "${COL_LB}Changing settings.json${COL_DEFAULT}"
sed -i '6s/.*/    "user":$adminuser/' settings.json
sed -i '7s/.*/    "password":$adminpass/' settings.json
sed -i '32s/.*/      "username":$adminuser/' settings.json
sed -i '33s/.*/      "password":$adminpass/' settings.json


# ===== Step 5 =====
echo -e "${COL_LG}Starting step 5: Setting up MySQL database ${COL_DEFAULT}"
# Setup MySQL

sudo mysql -uroot -p$userpass -e "GRANT ALL PRIVILEGES ON *.* TO '$adminuser'@'%' IDENTIFIED BY '$adminpass'";
sudo mysql -uroot -p$userpass -e "GRANT FILE ON *.* TO '$adminuser'@'%'";
sudo mysql -uroot -p$userpass -e "create database rfidnetwork";
sudo mysql -uroot -p$userpass rfidnetwork -e "CREATE TABLE birds (rfidTag VARCHAR(10), bandID VARCHAR(20), sex VARCHAR(20), age VARCHAR(20), taggedDateTime DATETIME, taggedLocation VARCHAR(50), comment TEXT, UNIQUE(rfidTag))";
sudo mysql -uroot -p$userpass rfidnetwork -e "CREATE TABLE boxes (box VARCHAR(20), reader VARCHAR(20), lat VARCHAR(20), lon VARCHAR(20), fieldSite VARCHAR(50), taggedDateTime VARCHAR(20), comment TEXT, currentDraw INT(11), currentSupply INT(11), UNIQUE(reader))";
sudo mysql -uroot -p$userpass rfidnetwork -e "CREATE TABLE readerdata (rfid VARCHAR(10), datetime DATETIME, reader VARCHAR(20), box VARCHAR(20), fieldSite VARCHAR(50))";

echo ""


echo -e "${COL_LG}Almost finished with installation.  The last step is to restart the RPi ${COL_DEFAULT}"
echo -e "${COL_LB}Do you want to restart now? [Y/n] ${COL_LP}" 
read yn
case $yn in
	[Yy]* ) sudo reboot;;
	[Nn]* ) echo -e "${COL_LR}You will need to restart before the system works. ${COL_DEFAULT}";;
esac

exit 0

changes needed
- Check problems with MySQL not generating correctly
- change settings.json
- add service to rc.local (maybe not needed)
