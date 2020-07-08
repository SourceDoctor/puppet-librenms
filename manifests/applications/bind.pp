#
class librenms::applications::bind (
  Boolean $enabled = true,

  String $rndc = '/usr/sbin/rndc',
  Boolean $call_rndc = true,
  String $stats_file = '/var/run/named/stats',
  Boolean $agent = false,
  Boolean $zero_stats = false,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    file {$stats_file:
        ensure => 'present',
        mode   => '0644',
        owner  => $librenms::params::bind_user,
        group  => $librenms::params::bind_group,
        notify => Service['bind9'],
    }

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/bind.config":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/bind.config.erb'),
    }

    create_resources(librenms::fetch, {
            'bind' => {
            use => $enabled,
    }})

    librenms::snmpd{'bind':
        use    => $enabled,
        script => 'bind'
    }
}

