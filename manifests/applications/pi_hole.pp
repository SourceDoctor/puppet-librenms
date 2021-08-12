class librenms::applications::pi_hole (
  String $api_auth_key,
  Boolean $enabled = true,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    ensure_packages([$librenms::params::jq_package], {ensure => present})

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'pi-hole' => {
            use => $enabled,
    }})

    file {"${snmpd_dir}/pi-hole.conf":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/pi-hole.conf.erb'),
    }

    librenms::snmpd{'pi-hole':
        use    => $enabled,
        script => 'pi-hole'
    }
}

