##
class librenms::applications::puppet_agent (
  Boolean $enabled = true,
) inherits librenms::params {

    ensure_packages([$librenms::params::python3_yaml_package], {ensure => present})

    create_resources(librenms::fetch, {
            'puppet_agent.py' => {
            use       => $enabled,
    }})

    librenms::snmpd{'puppet-agent':
        use    => $enabled,
        script => 'puppet_agent.py'
    }
}
