class librenms::applications::exim (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'exim-stats.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'exim-stats':
        use     => $enabled,
        script  => 'exim-stats.sh',
        do_sudo => true,
    }
}

