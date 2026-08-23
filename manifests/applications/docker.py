class librenms::applications::seafile (
  Boolean $enabled = true,
) inherits librenms::params {

    $snmpd_user = $librenms::params::snmpd_user

    $snmpd_dir = $librenms::params::snmpd_dir

    ensure_packages([$librenms::params::python3_dateutil_package], {ensure => present})

    create_resources(librenms::fetch, {
            'docker-stats.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'docker':
        use    => $enabled,
        script => 'docker-stats.py'
    }

    exec {'add_to_group':
        command => "/bin/id -Gn ${snmpd_user} | /bin/grep -qw docker",
        unless  => "/usr/sbin/usermod -a -G docker ${snmpd_user}",
    }
}

