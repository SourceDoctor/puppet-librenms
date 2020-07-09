class librenms::applications::dhcp (
  Boolean $enabled = true,

  String $lease_file = '/var/lib/dhcp/dhcpd.leases',
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    ensure_packages([$librenms::params::dhcpd_pools_package], {ensure => present})

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/dhcp.json":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/dhcp.json.erb'),
    }

    create_resources(librenms::fetch, {
            'dhcp.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'dhcpstats':
        use      => $enabled,
        script   => 'dhcp.py',
        filename => 'dhcp'
    }
}

