class librenms::applications::powerdns_recursor (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'powerdns-recursor' => {
            use => $enabled,
    }})

    librenms::snmpd{'powerdns-recursor':
        use    => $enabled,
        script => 'powerdns-recursor'
    }
}

