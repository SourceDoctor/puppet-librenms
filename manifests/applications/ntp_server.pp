class librenms::applications::ntp_server (
  Boolean $enabled = true,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/ntp-server.conf":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/ntp-server.conf.erb'),
    }

    create_resources(librenms::fetch, {
            'ntp-server.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'ntp-server':
        use    => $enabled,
        script => 'ntp-server.sh'
    }
}

