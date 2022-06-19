class librenms::applications::mdadm (
  Boolean $enabled = true,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    ensure_packages([$librenms::params::jq_package])

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'mdadm' => {
            use => $enabled,
    }})

    librenms::snmpd{'mdadm':
        use    => $enabled,
        script => 'mdadm'
    }
}

