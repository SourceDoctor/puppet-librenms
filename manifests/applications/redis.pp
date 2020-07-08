class librenms::applications::redis (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'redis.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'redis':
        use    => $enabled,
        script => 'redis.py'
    }
}

