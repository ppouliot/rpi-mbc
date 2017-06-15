# this is a debian/ubuntu specific command
release=`lsb_release -c | awk '{print $2}'`

echo '### INSTALLING PUPPETLABS APT REPO ###'
wget http://apt.puppetlabs.com/puppetlabs-release-$release.deb; dpkg -i puppetlabs-release-$release.deb
if [ $? $test -eq 1 ]; then
   echo "Could not find puppetlabs release for $release.  Trying alternative."
   wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb; dpkg -i puppetlabs-release-precise.deb
fi

echo '### UPDATING AND INSTALLING NECESSARY PACKAGES ###'
apt-get update -y && apt-get install -y openssh-server git puppet ruby ruby-dev software-properties-common

echo "### INSTALLING  R10K ###"
gem install r10k
puppet agent --debug --trace --verbose --enable
puppet agent --debug --trace --verbose --test --waitforcert=60 --server=moneypenny.openstack.tld
