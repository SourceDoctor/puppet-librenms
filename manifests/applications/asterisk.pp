class librenms::applications::asterisk (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'asterisk' => {
            use => $enabled,
    }})

    librenms::snmpd{'asterisk':
        use    => $enabled,
        script => 'asterisk'
    }
}

