class profile::base(
  #$ntp_servers = $facts['os']['family'] ? { 
  # 'Debian' 	=> ['0.debian.pool.ntp.org', '1.debian.pool.ntp.org', '2.debian.pool.ntp.org'], 
  # default     => ['0.centos.pool.ntp.org', '1.centos.pool.ntp.org'],
  # }
  Array[String] $ntp_servers,
) {
  include ::ssh
  class { '::ntp' :
    servers => $ntp_servers,
  }

  if $facts['os']['family'] == 'Redhat' {
    include ::profile::selinux
  }
}
