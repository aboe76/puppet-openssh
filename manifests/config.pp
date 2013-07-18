class openssh::config {
  file { $openssh::params::sshd_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    replace => true,
    source  => "puppet:///modules/${module_name}/sshd_config",
    require => Class['openssh::install'],
    notify  => Class['openssh::service'],
  }
}
