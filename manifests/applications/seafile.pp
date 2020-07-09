class librenms::applications::seafile (
  String $url,
  String $login,
  String $password,
  Enum['name', 'email'] $identifier = 'name',
  Boolean $hide_monitoring_account = true,

  Boolean $enabled = true,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    ensure_packages([$librenms::params::python3_requests_package], {ensure => present})

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/seafile.json":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/seafile.json.erb'),
    }

    create_resources(librenms::fetch, {
            'seafile.py' => {
            use => $enabled,
    }})

    librenms::snmpd{'seafile':
        use    => $enabled,
        script => 'seafile.py'
    }
}

