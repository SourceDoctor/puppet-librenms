##
class librenms::applications::puppet_agent (
  Boolean $enabled = true,
) inherits librenms::params {

    package {'python3-yaml':
        ensure => 'latest',
    }

    create_resources(librenms::fetch, {
            'puppet_agent.py' => {
            use       => $enabled,
    }})

    librenms::snmpd{'puppet-agent':
        use    => $enabled,
        script => 'puppet_agent.py'
    }
}
