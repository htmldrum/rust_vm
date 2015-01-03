#!/usr/bin/env bash
#
# Provisions an Ubuntu server with Rails 4, on Ruby 2.1.2, for a development environment.
#
# Requires:
#  - sudo privileges
#  - some Ruby pre installed & ERB 


# make script halt on failed commands
set -e

# protect against execution as root
# if [ "$(id -u)" == "0" ]; then
#    echo "Please run this script as a regular user with sudo privileges." 1>&2
#    exit 1
# fi


# =============================================================================
#   Variables
# =============================================================================

export DEBIAN_FRONTEND=noninteractive

# read variables from .env file if present
if [[ -e ./.env ]]; then
  . ./.env
  echo "(.env file detected and sourced)"
fi

# log file receiving all command output
PROVISION_TMP_DIR=${PROVISION_TMP_DIR:-"/tmp/provisioner"}
LOG_FILE=$PROVISION_TMP_DIR/provision-$(date +%Y%m%d%H%M%S).log
mkdir -p $PROVISION_TMP_DIR
touch $LOG_FILE
ENVIRONMENT=${ENVIRONMENT:-"TEST"}
echo "Provisioning Rust for environment: ${RAILS_ENV}"

# =============================================================================
#   Bootstrap
# =============================================================================

# update packages and install some dependencies and tools
echo "Updating packages..."
{
  # Using ssh agent forwarding
  ssh-keyscan -H github.com >> ~/.ssh/known_hosts
  #ssh-keygen -t rsa -N "" -f "~/.ssh/id_rsa"
  sudo apt-get update
  sudo apt-get -y install build-essential zlib1g-dev curl libcurl4-openssl-dev git-core software-properties-common vim git
} >> $LOG_FILE 2>&1

echo "Fetching from GitHub"
{
  git clone git@github.com:htmldrum/rust.git
} >> $LOG_FILE 2>&1
cd rust

echo "Building"
{
  ./configure
  make && sudo make install
} >> $LOG_FILE 2>&1

# create the output log file
mkdir -p $PROVISION_TMP_DIR
touch $LOG_FILE
echo "Logging command output to $LOG_FILE"

echo "Initializing application's database..."
{
  bundle exec rake db:restore
  bundle exec rake indexers:destroy
  bundle exec rake indexers:create
} >> $LOG_FILE 2>&1

# Starting app
echo "Starting app" >> $LOG_FILE 2>&1
sudo service unicorn start >> $LOG_FILE 2>&1
sudo service nginx start >> $LOG_FILE 2>&1

echo "Provisioning completed successfully!"
exit 0
