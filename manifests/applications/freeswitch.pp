class librenms::applications::freeswitch (
  Boolean $enabled = true,
) inherits librenms::params {

    $snmpd_dir = $librenms::params::snmpd_dir

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    create_resources(librenms::fetch, {
            'freeswitch' => {
             use      => $enabled,
             base_url => 'http://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/agent-local'
    }})

    librenms::snmpd{'freeswitch':
        use    => $enabled,
        script => 'freeswitch'
    }
}

