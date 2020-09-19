class librenms::applications::icecast (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'icecast-stats.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'icecast':
        use    => $enabled,
        script => 'icecast-stats.sh',
    }
}
