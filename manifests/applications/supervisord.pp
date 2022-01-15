class librenms::applications::supervisord (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'supervisord.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'supervisord':
        use    => $enabled,
        script => 'supervisord.py'
    }
}

