class librenms::applications::distribution (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'distro' => {
            use => $enabled,
    }})

    librenms::snmpd{'distro':
        use      => $enabled,
        filename => 'distribution',
        script   => 'distro',
    }
}

