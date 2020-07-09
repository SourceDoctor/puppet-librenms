class librenms::applications::backupninja (
  Boolean $enabled = true,

) inherits librenms::params {

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'backupninja.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'backupninja':
        use    => $enabled,
        script => 'backupninja.py'
    }
}

