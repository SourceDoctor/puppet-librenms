Puppet Module for LibreNMS SNMP Agents
=================================

[![Build Status](https://travis-ci.org/SourceDoctor/puppet-librenms.svg?branch=master)](https://travis-ci.org/SourceDoctor/puppet-librenms)


Description
-----------

Puppet Module to configure and distribute [LibreNMS_SNMP_Agents](https://docs.librenms.org/Extensions/Applications/).

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
  apache2             => false,
  asterisk            => false,
  backupninja         => false,
  bind                => false,
  certificate         => false,
  chip                => false,
  dhcp                => false,
  distribution        => false,
  entropy             => false,
  exim                => false,
  freeradius          => false,
  freeswitch          => false,
  gpsd                => false,
  mdadm               => false,
  icecast             => false,
  memcached           => false,
  mysql               => false,
  nfs_client          => false,
  nfs_server          => false,
  nginx               => false,
  ntp_client          => false,
  ntp_server          => false,
  nvidia              => false,
  open_grid_scheduler => false,
  opensips            => false,
  osupdate            => false,
  php_fpm             => false,
  pi_hole             => false,
  portactivity        => false,
  postfix             => false,
  powerdns            => false,
  powerdns_recursor   => false,
  puppet_agent        => false,
  pureftpd            => false,
  redis               => false,
  sdfsinfo            => false,
  seafile             => false,
  smartmontools       => false,
  squid               => false,
  ups_apcups          => false,
  ups_nut             => false,
  voipmon             => false,
  zfs                 => false,
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
1. [Distribution](#distribution) - SNMP extend
1. [Entropy](#entropy) - SNMP extend
1. [Exim](#exim) - SNMP extend
1. [FreeRADIUS](#freeradius) - SNMP extend
1. [FreeSwitch](#freeswitch) - SNMP extend
1. [GPSD](#gpsd) - SNMP extend
1. [Icecast](#icecast) - SNMP extend
1. [Mailcow-dockerized Postfix](#mailcow-dockerized-postfix) - SNMP extend
1. [Mailscanner](#mailscanner) - SNMP extend
1. [Mdadm](#mdadm) - SNMP extend
1. [Memcached](#memcached) - SNMP extend
1. [MySQL](#mysql) - SNMP extend
1. [NFS Client](#nfs-client) - SNMP extend
1. [NFS Server](#nfs-server) - SNMP extend
1. [Nginx](#nginx) - SNMP extend
1. [NTP Client](#ntp-client) - SNMP extend
1. [NTP Server/NTPD](#ntp-server-aka-ntpd) - SNMP extend
1. [Nvidia GPU](#nvidia-gpu) - SNMP extend
1. [Open Grid Scheduler](#open-grid-scheduler) - SNMP extend
1. [Opensips](#opensips) - SNMP extend
1. [OS Updates](#os-updates) - SNMP extend
1. [PHP FPM](#php-fpm) - SNMP extend
1. [Pi-Hole](#pi-hole) - SNMP extend
1. [Portactivity](#portactivity) - SNMP extend
1. [Postfix](#postfix) - SNMP extend
1. [PowerDNS](#powerdns) - SNMP extend
1. [PowerDNS Recursor](#powerdns-recursor) - SNMP extend
1. [Puppet Agent](#puppet_agent) - SNMP extend
1. [PureFTPd](#pureftpd) - SNMP extend
1. [Redis](#redis) - SNMP extend
1. [SDFSinfo](#sdfs-info) - SNMP extend
1. [Seafile](#seafile) - SNMP extend
1. [SMART](#smart) - SNMP extend
1. [Squid](#squid) - SNMP extend
1. [UPS APCUPS](#ups-apcups) - SNMP extend
1. [UPS Nut](#ups-nut) - SNMP extend
1. [Voip Monitor](#voipmon) - SNMP extend
1. [ZFS](#zfs) - SNMP extend


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


#### Distribution

This Agent returns Operation System Details to LibreNMS

```puppet
class { 'librenms::applications::distribution':
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


#### GPSD
```puppet
class { 'librenms::applications::gpsd':
}
```

No further configurations needed.


#### Icecast
```puppet
class { 'librenms::applications::icecast':
}
```

No further configurations needed.


#### Mailcow-dockerized postfix
```puppet
class { 'librenms::applications::mailcow_dockerized_postfix':
}
```

No further configurations needed.


#### Mailscanner
```puppet
class { 'librenms::applications::mailscanner':
}
```

No further configurations needed.


#### Mdadm
```puppet
class { 'librenms::applications::mdadm':
}
```

No further configurations needed.


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


#### NFS Client

Only FreeBSD Version present

```puppet
class { 'librenms::applications::nfs_client':
}
```

No further configurations needed.


#### NFS Server
```puppet
class { 'librenms::applications::nfs_server':
}
```

No further configurations needed.


#### Nginx
```puppet
class { 'librenms::applications::nginx':
}
```

Ensure all depending configurations are done.
For Details take a look here [Nginx](https://docs.librenms.org/Extensions/Applications/#nginx)


#### NTP-Client
```puppet
class { 'librenms::applications::ntp_client':
}
```

No further configurations needed.


#### NTP-Server aka NTPd
```puppet
class { 'librenms::applications::ntp_server':
}
```

No further configurations needed.


#### Nvidia GPU
```puppet
class { 'librenms::applications::nvidia':
}
```

No further configurations needed.


#### Open Grid Scheduler
```puppet
class { 'librenms::applications::open_grid_scheduler':
}
```

No further configurations needed.


#### Opensips
```puppet
class { 'librenms::applications::opensips':
}
```

No further configurations needed.


#### OS-Updates
```puppet
class { 'librenms::applications::osupdate':
}
```

No further configurations needed.


#### PHP FPM
```puppet
class { 'librenms::applications::php_fpm':
}
```

No further configurations needed.


#### Pi Hole
```puppet
class { 'librenms::applications::pi_hole':
  api_auth_key => 'someapiauthkey'
}
```

* `api_auth_key` To get all data you must configure your API auth token from Pi-hole server.


#### Portactivity
```puppet
class { 'librenms::applications::portactivity':
  services => [],
}
```

* `services` List of Services to be monitored

Example:
```
['http, 'ldap', 'imap']
```

Services should be listed in `/etc/services`


#### Postfix
```puppet
class { 'librenms::applications::postfix':
}
```

No further configurations needed.


#### Postgres
```puppet
class { 'librenms::applications::postgres':
}
```

No further configurations needed.


#### PowerDNS
```puppet
class { 'librenms::applications::powerdns':
}
```

No further configurations needed.


#### PowerDNS dnsdist
```puppet
class { 'librenms::applications::powerdns_dnsdist':
}
```

No further configurations needed.


#### PowerDNS Recursor
```puppet
class { 'librenms::applications::powerdns_recursor':
}
```

Add to the LibreNMS `config.php` file such options:
`$config['apps']['powerdns-recursor']['api-key']` required, this is defined in the Recursor config

`$config['apps']['powerdns-recursor']['port']` numeric, defines the port to connect to PowerDNS Recursor on. The default is 8082

`$config['apps']['powerdns-recursor']['https']` true or false, defaults to use http.


#### Proxmox
```puppet
class { 'librenms::applications::proxmox':
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


#### Raspberry Pi
```puppet
class { 'librenms::applications::raspberry_pi':
}
```

No further configurations needed.


#### Redis
```puppet
class { 'librenms::applications::redis':
}
```

No further configurations needed.


#### SDFS info
```puppet
class { 'librenms::applications::sdfsinfo':
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
* `login` Login to Seafile Server. It is important that used Login has admin privileges. Otherwise most API calls will be denied. Default: ''
* `password` Password to the configured login. Default: ''
* `identifier` Defines how user accounts are listed in RRD Graph. Options are: name, email. Default: name
* `hide_monitoring_account` With this Boolean you can hide the Account which you use to access Seafile API. Default: true


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


#### Unbound
```puppet
class { 'librenms::applications::unbound':
}
```

Ensure all depending configurations are done.
For Details take a look here [Unbound](https://docs.librenms.org/Extensions/Applications/#unbound)


#### UPS APCUPS
```puppet
class { 'librenms::applications::ups_apcups':
}
```

No further configurations needed.


#### UPS Nut
```puppet
class { 'librenms::applications::ups_nut':
  usv => 'my.usv.hostname',
}
```

* `usv` hostname of the USV which has to be monitored


#### Voipmon
```puppet
class { 'librenms::applications::voipmon':
}
```

No further configurations needed.


#### ZFS
```puppet
class { 'librenms::applications::zfs':
}
```

No further configurations needed.

