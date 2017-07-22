#!/usr/bin/env bash

# Set ulimits according to: https://blogs.progarya.dk/blog/how-to-persist-ulimit-settings-in-osx/


# Get absolute path of this bash script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

########################################################
# For macOS 10.9-10.12
# Copies the ulimit file into the System configuation
sudo cp "${DIR}/limit.maxfiles.plist" /Library/LaunchDaemons/limit.maxfiles.plist

# Apply the proper permissions requied by macOS
sudo chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist
sudo chmod 0644 /Library/LaunchDaemons/limit.maxfiles.plist

########################################################
# For OS X 10.8
# Copies the sysctl file into the System configuation
sudo cp "${DIR}/sysctl.conf" /etc/sysctl.conf

# Apply the proper permissions requied by macOS
sudo chown root:wheel /etc/sysctl.conf
sudo chmod 0644 /etc/sysctl.conf

########################################################
# For OS X 10.7 and before
# Copies the launchd file into the System configuation
sudo cp "${DIR}/launchd.conf" /etc/launchd.conf

# Apply the proper permissions requied by macOS
sudo chown root:wheel /etc/launchd.conf
sudo chmod 0644 /etc/launchd.conf

########################################################
# Apply settings for this session
sudo ulimit -n 65535
ulimit -n 65535
