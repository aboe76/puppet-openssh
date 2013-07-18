class openssh::knownhosts {
  Sshkey <<| |>> {
    ensure => present,
  }
}
