class librenms::applications::powerdns (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'powerdns.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'powerdns':
        use    => $enabled,
        script => 'powerdns.py'
    }
}

