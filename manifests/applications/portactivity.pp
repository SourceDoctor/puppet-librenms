class librenms::applications::portactivity (
  Boolean $enabled = true,
  Array[String] $services = [],
) inherits librenms::params {

    ensure_packages([$librenms::params::libjson_perl_package, $librenms::params::libparse_netstat_perl_package], {ensure => present})

    create_resources(librenms::fetch, {
            'portactivity' => {
            use => $enabled,
    }})

    if size($services) {
        $script_args = '-p ' + join($services, ',')
    } else {
        $script_args = ''
    }

    librenms::snmpd{'portactivity':
        use         => $enabled,
        script_args => $script_args,
        script      => 'portactivity'
    }
}

