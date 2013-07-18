class openssh {
  include openssh::params
  include openssh::install
  include openssh::config
  include openssh::service
  include openssh::hostkeys
  include openssh::knownhosts
}
