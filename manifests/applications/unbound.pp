class librenms::applications::unbound (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'unbound' => {
            use => $enabled,
    }})

    librenms::snmpd{'unbound':
        use     => $enabled,
        script  => 'unbound',
        do_sudo => true,
    }
}

