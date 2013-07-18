define openssh::configline (
  $ensure = present,
  $value = false
) {
  include openssh

  Augeas {
    context => "/files${openssh::params::sshd_config}",
    notify  => Class['openssh::service'],
    require => Class['openssh::config'],
  }

  case $ensure {
    present: {
      augeas { "sshd_config_${name}":
        changes => "set ${name} ${value}",
        onlyif  => "get ${name} != ${value}",
      }
    }
    add: {
      augeas { "sshd_config_${name}":
        onlyif  => "get ${name}[. = '${value}'] != ${value}",
        changes => [
          "ins ${name} after ${name}[last()]",
          "set ${name}[last()] ${value}"
        ],
      }
    }
    absent: {
      augeas { "sshd_config_${name}":
        changes => "rm ${name}",
        onlyif  => "get ${name}",
      }
    }
    default: {
      fail("ensure value must be present, add or absent, not ${ensure}")
    }
  }
}
