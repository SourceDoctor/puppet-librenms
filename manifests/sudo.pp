#
define librenms::sudo (
    String $script, # script to be run in sudo mode
    String $filename = $title, # Filename of sudo enhancement
    String $agent_name = $title, # Agent Description
    Boolean $use = true,  # install extends?
)
{
    include librenms

    $snmpd_dir = $librenms::snmpd_dir
    $sudo_dir = $librenms::sudo_dir
    $sudo_user = $librenms::snmpd_user

    if $use {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    file {"${sudo_dir}/librenms_${filename}":
        ensure  => $file_existance,
        owner   => 'root',
        group   => 'root',
        mode    => '0440',
        content => template('librenms/sudo.extend.erb')
    }
}
