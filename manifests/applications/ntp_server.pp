class librenms::applications::ntp_server (
  Boolean $enabled = true,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'ntp-server.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'ntp-server':
        use    => $enabled,
        script => 'ntp-server.py'
    }
}

