#puppet-openssh

[![Build Status](https://secure.travis-ci.org/aboe76/puppet-openssh.png?branch=master)](http://travis-ci.org/aboe76/puppet-openssh)

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with openssh](#setup)
    * [What openssh affects](#what-openssh-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with openssh](#beginning-with-openssh)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Credits - Credits where credits are due.](#credits)

# openSSH Puppet Module Arch Linux

Manage SSH client and server via Puppet on Arch Linux.
Both client and server are installed
Host keys will be collected and distributed

##Module Description

The openssh module handles running openssh server/client in Arch Linux systems
with systemd. 

##Setup

###What openssh affects

 * openssh package.
 * openssh configuration files.
 * openssh hostkeys.
 * openssh knownhosts.
 * openssh service.
 
###Beginning with openssh

include '::openssh' is all you need to get it running.
Or put this in your manifest:


```puppet
class { '::openssh':}
```

## Requirements
Requires Exported resources and augeas in order to work

##Usage

All interaction with the openssh module can be done through
the main openssh class.

###I just want openssh, what's the minimum I need?

```puppet
include '::openssh'
```

##Reference

###Classes
 * openssh: Main class, includes all the rest.
 * openssh::install: Handles the packages.
 * openssh::config: Handles the configuration file.
 * openssh::hostkeys: Handles the hostkeys.
 * openssh::knownhosts: Handles the knownhosts.
 * openssh::service: Handles the service.

###Parameters

The following parameters are available in the chrony module

####`sshd_config`

This sets the file to write opensshd server configuration into.

####`ssh_config`

This sets the file to write openssh client configuration into.

####`ssh_known_hosts`

This sets the file to write known-hosts into.

####`package_name`

This determines the name of the package to install.

####`service_name`

This selects the name of the openssh service for puppet to manage.

##Limitations

This module has been built on and tested against Puppet 3.2.3 and higher.

The module has been tested on:
 * Arch Linux


## credits
This module is based on saz-ssh module, only difference is
that Arch Linux installs only one package openssh for client and server.

at the moment this isn't easy to mix Arch Linux installs with other distributions.
