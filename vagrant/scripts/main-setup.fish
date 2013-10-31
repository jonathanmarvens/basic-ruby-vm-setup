#!/usr/bin/env fish

# Set a couple environment variables.
set -x V_APTITUDE_FLAGS "--no-gui" "-y"
set -x V_FILES_DIRECTORY /vagrant/files
set -x V_TEMPLATES_DIRECTORY /vagrant/templates
set -x V_PROVISIONING_SCRIPTS_DIRECTORY /vagrant/scripts/provisioning

# Just comment out the things not needed.
# fish $V_PROVISIONING_SCRIPTS_DIRECTORY/node-js.fish # Set up Node.js.
# fish $V_PROVISIONING_SCRIPTS_DIRECTORY/php.fish # Set up PHP.
fish $V_PROVISIONING_SCRIPTS_DIRECTORY/ruby.fish # Set up Ruby.

# Unset these environment variables since we no longer need them.
set -e V_APTITUDE_FLAGS
set -e V_FILES_DIRECTORY
set -e V_TEMPLATES_DIRECTORY
set -e V_PROVISIONING_SCRIPTS_DIRECTORY