class librenms::applications::powerdns_dnsdist (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'powerdns-dnsdist' => {
            use => $enabled,
    }})

    librenms::snmpd{'powerdns-dnsdist':
        use    => $enabled,
        script => 'powerdns-dnsdist'
    }
}

