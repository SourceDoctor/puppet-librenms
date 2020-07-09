class librenms::applications::certificate (
  Boolean $enabled = true,

  Hash $certificates = {},
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    ensure_packages([$librenms::params::python3_openssl_package], {ensure => present})

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/certificate.json":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/certificate.erb'),
    }

    create_resources(librenms::fetch, {
            'certificate.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'certificate':
        use    => $enabled,
        script => 'certificate.py'
    }
}

