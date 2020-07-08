class librenms::applications::memcached (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'memcached' => {
            use => $enabled,
    }})

    librenms::snmpd{'memcached':
        use    => $enabled,
        script => 'memcached'
    }
}

