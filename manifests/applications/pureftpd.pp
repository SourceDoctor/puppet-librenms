class librenms::applications::pureftpd (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'pureftpd.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'pureftpd':
        use     => $enabled,
        script  => 'pureftpd.py',
        do_sudo => true,
    }
}

