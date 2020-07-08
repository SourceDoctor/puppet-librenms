class librenms::applications::smartmontools (
  Boolean $enabled = true,

  String $cache = '/var/cache/smart',
  Boolean $use_sn = true,
  Hash $smart_options = {},
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/smart.config":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/smart.conf.erb'),
    }

    file {'/etc/cron.d/smart':
        ensure => $file_existance,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/librenms/smart_cron.d',
    }

    create_resources(librenms::fetch, {
            'smart' => {
            use => $enabled,
    }})

    librenms::snmpd{'smart':
        use      => $enabled,
        script   => 'smart',
        filename => 'smartmontools',
        do_sudo  => true,
    }
}

