class librenms::applications::nginx (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'nginx' => {
            use => $enabled,
    }})

    librenms::snmpd{'nginx':
        use    => $enabled,
        script => 'nginx'
    }
}

