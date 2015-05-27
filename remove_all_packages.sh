#!/bin/bash

# Remove all files.
sudo service mongod stop

sudo apt-get remove --purge mongodb-org

# Check all files.
sudo ps aux | grep mongo && sudo ls -al /etc/puppet/

# Run user_data.sh
# sudo bash ~/user_data.sh
