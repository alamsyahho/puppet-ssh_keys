# SSH Keys Module

Forked from nightfly19/puppet-ssh_keys
###### Changes:
1. Update README for hieradata config example
2. Fix ssh_dir for root directory

A concat based ssh authorized_keys management solution
created mostly to work around ssh_authorized_keys not being able to purge old keys.
Also since authorized keys are managed as file-lines you are not restricted to the subset of
ssh authorized_keys functionality that the ssh_authorized_keys resource imposes.

# Dependencies

## Required
* [puppet-concat](http://forge.puppetlabs.com/puppetlabs/concat)

# Quick Start

This module has been tested on Ubuntu though it is intended to work on any Unix/Linux like supported playform.

## Example Usage

#### Managing Keys in Hash

``` 
include ssh_keys

ssh_keys::user{'foo':
  manage_ssh_dir => true,
}

ssh_keys::authorized_key{'foo-laptop':
  key_line => 'ssh-rsa long-key-here foo@bar',
  user     => 'foo',
}
```

#### Managing Keys in Hiera

hieradata/nodes/dummy.example.com.yaml
```
classes:
  - ssh_keys

ssh_keys::user:
  foo:
    manage_ssh_dir: true

ssh_keys::authorized_key:
  jenkins:
    key_line: 'ssh-rsa long-key-here foo@bar'
    user: 'foo'
```
