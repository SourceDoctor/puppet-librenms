#
define librenms::snmpd (
    String $script, # script to be called
    String $script_args = '', # optional arguments for script
    String $extend_name = $title, # snmpd extend string
    String $filename = $title, # snmpd extend filename post
    Boolean $use = true,  # install extends?
    Boolean $do_sudo = false,  # run script in sudo mode?

    String $template = 'librenms/snmpd.extend.erb', # custom snmp template
    Optional[Hash] $custom = {}, # custom values for custom snmp template
)
{
    include librenms

    $snmpd_dir = $librenms::snmpd_dir
    $snmpd_extend_dir = $librenms::snmpd_extend_dir
    $sudo_bin = $librenms::sudo_bin

    if $use {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${snmpd_extend_dir}/librenms_${filename}.conf":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template($template),
        notify  => [Service[$librenms::params::snmpd_service], Exec['trigger_discovery']]
    }

    if $use and $do_sudo {
        $sudo_file_existance = true
    } else {
        $sudo_file_existance = false
    }

    create_resources(librenms::sudo, {$filename => {use    => $sudo_file_existance,
                                                    script => $script
    }})
}
