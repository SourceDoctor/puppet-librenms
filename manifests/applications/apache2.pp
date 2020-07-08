class librenms::applications::apache2 (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'apache-stats.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'apache':
        use      => $enabled,
        filename => 'apache2',
        script   => 'apache-stats.py'
    }
}

