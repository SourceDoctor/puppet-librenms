class librenms::applications::mailscanner (
  Boolean $enabled = true,
) inherits librenms::params {

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'mailscanner.php' => {
            use => $enabled,
    }})

    librenms::snmpd{'mailscanner':
        use    => $enabled,
        script => 'mailscanner.php'
    }
}

