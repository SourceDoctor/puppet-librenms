class librenms::applications::voipmon (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'voipmon-stats.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'voipmon':
        use    => $enabled,
        script => 'voipmon-stats.sh',
    }
}
