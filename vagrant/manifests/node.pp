# OAR node installation with puppet and vagrant

$oar_version = "2.5"
$oar_home    = "/var/lib/oar"
$files_path  = "/tmp/vagrant-puppet/manifests/files"

class {
  "oar::node":
    version => "2.5";
}

File { require => Package["oar-node"] }

file {
  "${oar_home}/.ssh":
    ensure => directory,
    mode => 755, owner => oar, group => oar;
  "${oar_home}/.ssh/authorized_keys":
    ensure => file,
    mode => 644, owner => oar, group => oar,
    source => "${files_path}/keys/node/authorized_keys";
  "${oar_home}/.ssh/id_rsa":
    ensure => file,
    mode => 600, owner => oar, group => oar,
    source => "${files_path}/keys/node/oar/id_rsa";
  "${oar_home}/.ssh/id_rsa.pub":
    ensure => file,
    mode => 644, owner => oar, group => oar,
    source => "${files_path}/keys/node/oar/id_rsa.pub";
  "${oar_home}/.ssh/oarnodesetting_ssh.key":
    ensure => file,
    mode => 600, owner => oar, group => oar,
    source => "${files_path}/keys/node/oarnodessetting/id_rsa";
  "${oar_home}/.ssh/oarnodesetting_ssh.key.pub":
    ensure => file,
    mode => 644, owner => oar, group => oar,
    source => "${files_path}/keys/node/oarnodessetting/id_rsa.pub";
}