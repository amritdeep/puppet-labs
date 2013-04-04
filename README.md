#Setup

$ wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb

$ sudo dpkg -i puppetlabs-release-precise.deb

$ sudo apt-get update

$ sudo apt-get install puppet-common

$ sudo apt-get install git

$ git clone git@githuben.intranet.mckinsey.com:Rocky-Jaiswal/dashboard-devops.git

$ cd dashboard-devops

$ chmod u+x setup.sh

$ ./setup.sh

$ sudo -u postgres createuser -D -A -P dashboard_prod

$ sudo -u postgres createdb -O dashboard_prod dashboard_prod

$ sudo passwd www
