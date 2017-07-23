#used to create default parameters as opposed to taking parameters
class ssh::params {
  # case $::osfamily
  case $facts['os']['family'] {
    'Debian': {
      $package_name = 'openssh-server'
      $service_name = 'ssh'
    }

    'RedHat': {
      $package_name = 'openssh-server'
      $service_name = 'sshd'
    }

   'default': {
      fail("${facts['operatingsystem']} is not supported")
    }
  }
}
