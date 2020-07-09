Puppet module for LibreNMS Agents
=================================

[![Build Status](https://travis-ci.org/SourceDoctor/puppet-librenms.svg?branch=master)](https://travis-ci.org/SourceDoctor/puppet-librenms)

Description
-----------

Puppet module to configure and distribute [LibreNMS_SNMP_Agents](https://docs.librenms.org/Extensions/Applications/).

(Server configuration will come in a future version also)

Dependencies
------------
This Modul doesn't modify configuration of services the Agents are for.
So please ensure the services you want to monitor match the requirements.
Details for what to do are described or linked per Agent.

General Information
-------------------
It's recommended to use [puppet-hiera](https://puppet.com/docs/puppet/latest/hiera_intro.html) for configuration

Usage
-----

### Define Source of LibreNMS Agent Scripts
```puppet
class { 'librenms':
  use_local_agents => true,
}
```

* `use_local_agents` If set to false Agent Scripts will be copied directly from Github. Default: true


### Discovery Trigger Configuration

Configuration of Discovery Trigger for LibreNMS.
It's called everytime a LibreNMS Agent is installed.

```puppet
class {'librenms::discovery':
    librenms_server    => 'librenms.local.domain',
    api_token          => 'myAdminApiToken',
    transport_protocol => 'http',
}
```

* `librenms_server` The FQDN or IP Address on which LibreNMS is listen
* `api_token` is the API Token generated in LibreNMS from an Admin User
* `transport_protocol` defines the used transportprotocol. Can be `http` or `https`


### Which Agent Scripts should be installed
```puppet
class {'librenms::application':
  apache2       => false,
  asterisk      => false,
  backupninja   => false,
  bind          => false,
  certificate   => false,
  chip          => false,
  dhcp          => false,
  distribution  => false,
  entropy       => false,
  exim          => false,
  freeradius    => false,
  mdadm         => false,
  memcached     => false,
  mysql         => false,
  ntp_server    => false,
  osupdate      => false,
  puppet_agent  => false,
  pureftpd      => false,
  redis         => false,
  seafile       => false,
  smartmontools => false,
  squid         => false,
}
```

* `<Agent Name>` A boolean on whether or not the agent has to be installed. Default: false


### LibreNMS Agent Configuration

1. [Apache](#apache) - SNMP extend
1. [Asterisk](#asterisk) - SNMP extend
1. [Backupninja](#backupninja) - SNMP extend
1. [BIND9/named](#bind9-aka-named) - SNMP extend
1. [C.H.I.P](#chip) - SNMP extend
1. [Certificate](#certificate) - SNMP extend
1. [DHCP Stats](#dhcp-stats) - SNMP extend
1. [Entropy](#entropy) - SNMP extend
1. [Exim](#exim) - SNMP extend
1. [FreeRADIUS](#freeradius) - SNMP extend
1. [Mdadm](#mdadm) - SNMP extend
1. [Memcached](#memcached) - SNMP extend
1. [MySQL](#mysql) - SNMP extend
1. [NTP Server/NTPD](#ntp-server-aka-ntpd) - SNMP extend
1. [OS Updates](#os-updates) - SNMP extend
1. [Puppet Agent](#puppet_agent) - SNMP extend
1. [PureFTPd](#pureftpd) - SNMP extend
1. [Redis](#redis) - SNMP extend
1. [Seafile](#seafile) - SNMP extend
1. [SMART](#smart) - SNMP extend
1. [Squid](#squid) - SNMP extend


#### Apache
```puppet
class { 'librenms::applications::apache2':
}
```

Ensure all depending configurations are done.
For Details take a look here [Apache2](https://docs.librenms.org/Extensions/Applications/#apache)


#### Asterisk
```puppet
class { 'librenms::applications::asterisk':
}
```

No further configurations needed.


#### Backupninja
```puppet
class { 'librenms::applications::backupninja':
}
```

No further configurations needed.


#### Bind
```puppet
class { 'librenms::applications::bind':
  rndc       => '/usr/sbin/rndc',
  call_rndc  => true,
  stats_file => '/var/run/named/stats',
  agent      => false,
  zero_stats => false,
}
```

* `rndc` The path to rndc
* `call_rndc` A boolean on whether or not to call rndc stats. Suggest to set to false if using netdata. Default: true
* `stats_file` The path to the named stats file. Default: /var/cache/bind/stats
* `agent` A boolean for if this is being used as a LibreNMS agent or not. Default: false
* `zero_stats` A boolean for if the stats file should be zeroed first. Default: false (true if guessed)


Ensure all depending configurations are done.
For Details take a look here [Bind](https://docs.librenms.org/Extensions/Applications/#bind9-aka-named)


#### Certificate
```puppet
class { 'librenms::applications::certificate':
  certificates = {},
}
```

* `certificates` A Hash of certificates to check Default: {}

Example:
```
{'domains' => [
    {'fqdn' => 'www.mydomain.com'},
    {'fqdn' => 'some.otherdomain.org',
     'port' => 8443},
    {'fqdn' => 'personal.domain.net'}
]
}
```

* `fqdn` the domain to check
* `port` If port differs from 443 you can specify it with this optional argument

Ensure all depending configurations are done.
For Details take a look here [Certificate](https://docs.librenms.org/Extensions/Applications/#certificate)


#### Chip

```puppet
class { 'librenms::applications::chip':
}
```

No further configurations needed.


#### DHCP-Stats
```puppet
class { 'librenms::applications::dhcp':
  lease_file => '/var/lib/dhcp/dhcpd.leases',
}
```

* `lease_file` Lease File of DHCP Stats. Default: /var/lib/dhcp/dhcpd.leases

Ensure all depending configurations are done.
For Details take a look here [Dhcp](https://docs.librenms.org/Extensions/Applications/#dhcp-stats)


#### Distribution

This Agent returns Operation System Details to LibreNMS

```puppet
class { 'librenms::applications::entropy':
}
```

No further configurations needed.


#### Entropy
```puppet
class { 'librenms::applications::entropy':
}
```

No further configurations needed.


#### Exim

```puppet
class { 'librenms::applications::exim':
}
```

No further configurations needed.


#### Fail2ban
```puppet
class { 'librenms::applications::fail2ban':
  cache => true,
}
```

* `true` If you want to cache results. Default: true


#### FreeRadius
```puppet
class { 'librenms::applications::bind':
  radius_server => 'localhost',
  radius_port   => 18121,
  radius_key    => 'adminsecret',
}
```

* `radius_server` IP or Domain Radius Server is listen on. Default: localhost
* `radius_port` Port on which Radius Server is listening. Default: 18121
* `radius_key` Key for authentication.


Ensure all depending configurations are done.
For Details take a look here [FreeRadius](https://docs.librenms.org/Extensions/Applications/#freeradius)


#### Freeswitch

```puppet
class { 'librenms::applications::freeswitch':
}
```

No further configurations needed.


#### Mdadm
```puppet
class { 'librenms::applications::mdadm':
}
```


#### Memcached
```puppet
class { 'librenms::applications::memcached':
}
```

No further configurations needed.


#### MySQL
```puppet
class { 'librenms::applications::mysql':
  user => 'root',
  pass => 'root',
  host => 'localhost',
  port => 3306,
}
```

* `user` Username. Default: root
* `pass` Password. Default: root
* `host` IP or Hostname Database Server is listening on. Default: localhost
* `port` Port Database Server is listening on. Default  3306


#### NTP-Server aka NTPd
```puppet
class { 'librenms::applications::ntp_server':
}
```

No further configurations needed.


#### OS-Updates
```puppet
class { 'librenms::applications::osupdate':
}
```

No further configurations needed.


#### Puppet Agent
```puppet
class { 'librenms::applications::puppet_agent':
}
```

Ensure all depending configurations are done.
For Details take a look here [Puppet_Agent](https://docs.librenms.org/Extensions/Applications/#puppet_agent)


#### PureFTPd
```puppet
class { 'librenms::applications::pureftpd':
}
```

No further configurations needed.


#### Redis
```puppet
class { 'librenms::applications::redis':
}
```

No further configurations needed.


#### Seafile
```puppet
class { 'librenms::applications::seafile':
  url                     => 'seafile.mydomain.local',
  login                   => 'somelogin',
  password                => 'somepassword',
  identifier              => 'name',
  hide_monitoring_account => true,
}
```

* `url` Url how to get access to Seafile Server. Default: ''
* `username` Login to Seafile Server. It is important that used Login has admin privileges. Otherwise most API calls will be denied. Default: ''
* `password` Password to the configured login. Default: ''
* `account_identifier` Defines how user accounts are listed in RRD Graph. Options are: name, email. Default: name
* `hide_monitoring_account` With this Boolean you can hide the Account which you use to access Seafile API. Default: true

Ensure all depending configurations are done.
For Details take a look here [Seafile](https://docs.librenms.org/Extensions/Applications/#seafile)


#### Smart

```puppet
class { 'librenms::applications::seafile':
  cache         => '/var/cache/smart',
  use_sn        => true,
  smart_options => {},
}
```

* `cache` File in which Smart Values should be cached. Default: /var/cache/smart
* `use_sn` A Boolean which defines if Serial Number of Device or Block Device Name should be used. Default: true
* `smart_options` A Hash to add additional Smartctl Parameters to specified Block Devices. Default: {}

Example:
```
{'da5' => '-d sat',
 'twl0,0' => '/dev/twl0 - 3ware,0',
 'twl0,1' => '/dev/twl0 - 3ware,1',
 'twl0,2' => '/dev/twl0 - 3ware,2',
}
```


#### Squid
```puppet
class { 'librenms::applications::squid':
  snmp_community => 'squid_snmp_community',
}
```

* `snmp_community` SNMP Community Squid uses to publish it's data

Ensure all depending configurations are done.
For Details take a look here [Squid](https://docs.librenms.org/Extensions/Applications/#squid)


