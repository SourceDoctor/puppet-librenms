class librenms::applications::ntp_client (
  Boolean $enabled = true,
) inherits librenms::params {

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'ntp-client' => {
            use => $enabled,
    }})

    librenms::snmpd{'ntp-client':
        use    => $enabled,
        script => 'ntp-client'
    }
}

