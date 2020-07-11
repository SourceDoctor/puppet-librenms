class librenms::applications::postgres (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'postgres' => {
            use => $enabled,
    }})

    librenms::fetch{'check_postgres.pl':
        use      => $enabled,
        base_url => 'https://raw.githubusercontent.com/bucardo/check_postgres/master',
    }

    librenms::snmpd{'postgres':
        use    => $enabled,
        script => 'postgres'
    }
}

