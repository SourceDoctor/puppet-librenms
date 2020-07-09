class librenms::applications::chip (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'chip.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'power-stat':
        use    => $enabled,
        script => 'chip.sh'
    }
}

