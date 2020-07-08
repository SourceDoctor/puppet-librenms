##
class librenms::applications::puppet_agent (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'puppet_agent.py' => {
            use       => $enabled,
    }})

    librenms::snmpd{'puppet-agent':
        use    => $enabled,
        script => 'puppet_agent.py'
    }
}
