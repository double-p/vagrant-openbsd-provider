
# Vagrant OpenBSD vmd(4) Provider

*NOTE* This is absolut alpha work-in-progress - DO NOT USE

This is a [Vagrant](http://www.vagrantup.com) 1.5+ plugin that adds an
[OpenBSD vmd(4)](https://man.openbsd.org/vmd) provider to Vagrant,
allowing Vagrant to control and provision machines on OpenBSD.

## Features

* Boot VM instances.
* SSH into the instances.
* Provision the instances with any built-in Vagrant provisioner.

## Installation

Install using standard Vagrant plugin installation methods.

```
$ vagrant plugin install vagrant-openbsd-provider
```

## Usage

Once the plugin is installed, you use it with `vagrant up` by specifing
the `openbsd-provider` provider:
```
$ vagrant up --provider=openbsd-provider
```

