class profile::apache(
  Boolean $default_vhost = false,
  #Integer $port = 80,
  #String $docroot = '/var/www/test',
  String $hostname = $facts['fqdn'],
  Hash $apache_vhost_servers,
) {
  class { '::apache':
    default_vhost => $default_vhost,
  }

  create_resources(::apache::vhost, $apache_vhost_servers)

  #::apache::vhost { $hostname:
   # port => $port,
   # docroot => $docroot,
  #}

}
