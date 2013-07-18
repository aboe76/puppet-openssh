# openSSH Puppet Module Archlinux

Manage SSH client and server via Puppet on archlinux


## on archlinux Both client and server are installed
Host keys will be collected and distributed

```
    include ssh
```

# Requirements
Requires Exported resources and augeas in order to work

# credits
this module is based on saz-ssh module, only difference is
that archlinux installs only one package openssh for client and server.

at the moment this isn't easy to mix archlinux installs with other distributions.
