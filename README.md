#Setup

$ wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb

$ sudo dpkg -i puppetlabs-release-precise.deb

$ sudo apt-get update

$ sudo apt-get install puppet-common

$ sudo apt-get install git

$ git clone git@github.com:rocky-jaiswal/dashboard-devops.git

$ cd dashboard-devops

$ chmod u+x setup.sh

$ ./setup.sh

$ sudo -u postgres createuser -D -A -P dashboard

$ sudo -u postgres createdb -O dashboard dashboard

$ sudo passwd www
