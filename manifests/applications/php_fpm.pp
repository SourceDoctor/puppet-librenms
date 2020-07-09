class librenms::applications::php_fpm (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'phpfpmsp' => {
            use => $enabled,
    }})

    librenms::snmpd{'phpfpmsp':
        use    => $enabled,
        script => 'phpfpmsp'
    }
}

