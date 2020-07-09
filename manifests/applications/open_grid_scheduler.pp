class librenms::applications::open_grid_scheduler (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'rocks.sh' => {
            use      => $enabled,
            base-url => 'https://raw.githubusercontent.com/librenms/librenms-agent/master/agent-local'
    }})

    librenms::snmpd{'ogs':
        use    => $enabled,
        script => 'rocks.sh'
    }
}

