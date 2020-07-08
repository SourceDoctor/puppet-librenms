class librenms::applications::osupdate (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'osupdate' => {
            use => $enabled,
    }})

    librenms::snmpd{'osupdate':
        use    => $enabled,
        script => 'osupdate'
    }
}

