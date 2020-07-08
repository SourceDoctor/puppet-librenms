class librenms::applications::entropy (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'entropy.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'entropy':
        use    => $enabled,
        script => 'entropy.sh'
    }
}

