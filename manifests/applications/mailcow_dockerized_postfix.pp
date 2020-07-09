class librenms::applications::mailcow_dockerized_postfix (
  Boolean $enabled = true,
) inherits librenms::params {

    ensure_packages([$librenms::params::pflogsumm_package], {ensure => present})

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'mailcow-dockerized-postfix' => {
            use => $enabled,
    }})

    librenms::snmpd{'mailcow-postfix':
        use    => $enabled,
        script => 'mailcow-dockerized-postfix'
    }
}

