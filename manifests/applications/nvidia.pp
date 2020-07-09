class librenms::applications::nvidia (
  Boolean $enabled = true,
) inherits librenms::params {

    ensure_packages([$librenms::params::nvidia_smi_package], {ensure => present})

    create_resources(librenms::fetch, {
            'nvidia' => {
            use => $enabled,
    }})

    librenms::snmpd{'nvidia':
        use    => $enabled,
        script => 'nvidia'
    }
}

