class openssh::params {
  case $::operatingsystem {
    Archlinux: {
      $package_name = 'openssh'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      $service_name = 'sshd'
    }
    default: {
      case $::operatingsystem {
        default : {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}
