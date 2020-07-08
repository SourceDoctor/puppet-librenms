#
define librenms::fetch (
    Boolean $use = true,  # if false -> script will be removed
    String $script_name = $title,
    String $base_url = 'http://raw.githubusercontent.com/librenms/librenms-agent/master/snmp',
){

    include librenms

    $snmpd_dir = $librenms::params::snmpd_dir

    $use_local_agents = $librenms::use_local_agents  # use local stored agent scripts (no remote sync)

    if $use {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    if $use_local_agents {
        file {"${snmpd_dir}/${script_name}":
            ensure => $file_existance,
            owner  => 'root',
            group  => 'root',
            mode   => '0755',
            source => "puppet:///modules/librenms/scripts/${script_name}",
        }
    } else {
        remote_file {"${snmpd_dir}/${script_name}":
          ensure => $file_existance,
          owner  => 'root',
          group  => 'root',
          mode   => '0755',
          source => "${base_url}/${script_name}",
        }
    }
}
