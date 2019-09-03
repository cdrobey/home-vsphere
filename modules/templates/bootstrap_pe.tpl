#!/bin/bash
#--------------------------------------------------------------
# This scripts bootstraps a linux node by installing a puppet
# master.
#
# The firewall must be disabled to function correctly.
#   Ubuntu:   "sudo systemctl disable ufw"
#   Centos:   "sudo iptables -F"
#--------------------------------------------------------------
set -x

#--------------------------------------------------------------
# Global Variables:
#   - PATH:       PATHs needed for command execution
#   - HOME:       Home Directory of script account
#   - WORKDIR:    TMP directory for script
#   - LOGFILE:    Execution Log for bootstrap on client hosts
#   - PVER:       Version of Puppet
#   - POS:        Operating System Version
#   - PFILE:      PE Installation File
#   - PURL:       URI of the download file
#   - Email:      Puppet Email Name
#   - GITURL:     Code Manager Control Repo
#--------------------------------------------------------------
PATH=$${PATH}:/opt/puppetlabs/bin
HOME=/root
WORKDIR="/tmp"
LOGFILE="$${WORKDIR}/bootstrap$$.log"
PVER="2019.1.0"
POS="ubuntu-18.04"
PFILE="puppet-enterprise-$${PVER}-$${POS}-amd64.tar.gz"
PURL="https://pm.puppetlabs.com/puppet-enterprise/$${PVER}/$${PFILE}"
EMAIL="chris.roberson@puppet.com"
GITURL="https://github.com/cdrobey/puppet-repo"

#--------------------------------------------------------------
# Redirect all stdout and stderr to logfile,
#--------------------------------------------------------------
echo "======================= Executing setup_logging ======================="
cd "$${WORKDIR}" || exit 1
exec > "$${LOGFILE}" 2>&1

#--------------------------------------------------------------
# Peform pre-master installation tasks.
#--------------------------------------------------------------
function pre_install_pe {
  echo "======================= Executing pre_install_pa ======================="

  wget $${PURL}
  tar -xzf $${PFILE} -C /tmp/
  mkdir -p /etc/puppetlabs/puppet/
  echo "*" > /etc/puppetlabs/puppet/autosign.conf
  cat > /etc/puppetlabs/puppet/csr_attributes.yaml << YAML
extension_requests:
    pp_role:  puppetmaster
YAML
}

#--------------------------------------------------------------
# Peform post-master installation tasks.
#--------------------------------------------------------------
function post_install_pe {
  echo "======================= Executing post_install_pe ======================="

  puppet module install pltraining-rbac
  cat > /tmp/user.pp << FILE
rbac_user { 'deploy':
    ensure       => 'present',
    name         => 'deploy',
    display_name => 'deployment user account',
    email        => '$${EMAIL}',
    password     => 'puppetlabs',
    roles        => [ 'Code Deployers' ],
}
FILE
  puppet apply /tmp/user.pp
  rm /tmp/user.pp
  puppet-access -t $${HOME}/.puppetlabs/token login --lifetime=1y << TEXT
deploy
puppetlabs
TEXT

  puppet-code -t $${HOME}/.puppetlabs/token deploy production -w
  puppet agent -t
}
#--------------------------------------------------------------
# Peform master installation tasks.
#--------------------------------------------------------------
function install_pe {
  echo "======================= Executing install_pe ======================="

  cat > /tmp/pe.conf << FILE
"console_admin_password": "puppetlabs"
"puppet_enterprise::puppet_master_host": "%%{::trusted.certname}"
"puppet_enterprise::profile::master::code_manager_auto_configure": true
"puppet_enterprise::profile::master::r10k_remote": "$${GITURL}"
FILE
  /tmp/puppet-enterprise-$${PVER}-$${POS}-amd64/puppet-enterprise-installer -c /tmp/pe.conf
  chown pe-puppet:pe-puppet /etc/puppetlabs/puppetserver/ssh/id-*
}

setup_host_name
pre_install_pe
install_pe
post_install_pe

echo "Completed the Bootstrap of Puppet Enterprise!"
