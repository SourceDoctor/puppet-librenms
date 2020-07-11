class librenms::applications::raspberry_pi (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'raspberry.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'raspberry':
        use     => $enabled,
        script  => 'raspberry.sh',
        do_sudo => true
    }
}

