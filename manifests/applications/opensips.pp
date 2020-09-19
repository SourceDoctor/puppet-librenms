class librenms::applications::opensips (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'opensips-stats.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'opensips':
        use    => $enabled,
        script => 'opensips-stats.sh',
    }
}
