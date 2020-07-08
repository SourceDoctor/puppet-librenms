class librenms::applications::mdadm (
  Boolean $enabled = true,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/mdadm.conf":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/mdadm.conf.erb'),
    }

    create_resources(librenms::fetch, {
            'mdadm' => {
            use => $enabled,
    }})

    librenms::snmpd{'mdadm':
        use    => $enabled,
        script => 'mdadm'
    }
}

