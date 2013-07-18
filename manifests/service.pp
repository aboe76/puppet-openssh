class openssh::service {
  include openssh::params

  service { $openssh::params::service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['openssh::config'],
  }
}
