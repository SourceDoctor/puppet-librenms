class librenms::applications::ups_apcups (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'ups-apcups' => {
            use => $enabled,
    }})

    librenms::snmpd{'ups-apcups':
        use    => $enabled,
        script => 'ups-apcups'
    }
}

