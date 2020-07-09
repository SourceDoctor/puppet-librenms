class librenms::applications::mysql (
  Boolean $enabled = true,

  String $user = 'root',
  String $pass = 'root',
  String $host = 'localhost',
  Integer $port = 3306,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    ensure_packages([$librenms::params::php_cli_package, $librenms::params::php_mysql_package], ensure => present)

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_dir}/mysql.cnf":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('librenms/mysql.cnf.erb'),
    }

    create_resources(librenms::fetch, {
            'mysql' => {
            use => $enabled,
    }})

    librenms::snmpd{'mysql':
        use    => $enabled,
        script => 'mysql'
    }
}
