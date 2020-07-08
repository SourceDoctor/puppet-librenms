class librenms::applications::freeradius (
  Boolean $enabled = true,
  String $radius_server = 'localhost',
  Integer $radius_port = 18121,
  String $radius_key = 'adminsecret',
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/freeradius.conf":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/freeradius.conf.erb'),
    }

    create_resources(librenms::fetch, {
            'freeradius.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'freeradius':
        use    => $enabled,
        script => 'freeradius.sh'
    }
}

