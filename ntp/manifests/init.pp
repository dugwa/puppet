# Class: ntp
# ===========================
#
# Full description of class ntp here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ntp':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class ntp( 
  String $package_name 		= $ntp::params::package_name,
  String $package_ensure  	= $ntp::parmas::package_ensure,
  String $config_file_name 	= $ntp::parmas::config_file_name,
  String $config_file_mode	= $ntp::parmas::config_file_mode,
  Array[String] $servers 	= $ntp::parmas::servers,
  String $service_ensure	= $ntp::parmas::service_ensure,
  String $service_name 		= $ntp::parmas::service_name,
  Boolean $service_enable	= $ntp::parmas::service_enable,
  Boolean $service_hasrestart	= $ntp::parmas::service_hasrestart,
  Boolean $service_hasstatus	= $ntp::parmas::service_hasstatus,
) inherits ::ntp::params {
  class {'::ntp::install': }
  -> class {'::ntp::config': }
  ~> class {'::ntp::service': }
}
