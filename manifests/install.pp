class openssh::install {
  include openssh::params
  package { $openssh::params::package_name:
    ensure => present,
  }
}
