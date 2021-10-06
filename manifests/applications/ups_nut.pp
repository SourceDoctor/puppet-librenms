class librenms::applications::ups_nut (
  String $usv,
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'ups-nut.sh' => {
            use => $enabled,
    }})

    librenms::snmpd{'ups-nut':
        use         => $enabled,
        script_args => $usv,
        script      => 'ups-nut.sh'
    }
}

