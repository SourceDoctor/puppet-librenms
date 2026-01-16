class librenms::applications::chrony (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'chrony' => {
            use => $enabled,
    }})

    librenms::snmpd{'chrony':
        use    => $enabled,
        script => 'chrony'
    }
}

