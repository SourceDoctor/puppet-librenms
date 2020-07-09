class librenms::applications::sdfsinfo (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'sdfsinfo' => {
            use => $enabled,
    }})

    librenms::snmpd{'sdfsinfo':
        use    => $enabled,
        script => 'sdfsinfo'
    }
}

