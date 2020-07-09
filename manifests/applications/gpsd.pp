class librenms::applications::gpsd (
  Boolean $enabled = true,
) inherits librenms::params {

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'gpsd' => {
            use => $enabled,
    }})

    librenms::snmpd{'gpsd':
        use    => $enabled,
        script => 'gpsd'
    }
}

