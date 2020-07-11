class librenms::applications::nfs_server (
  Boolean $enabled = true,
) inherits librenms::params {

    if $::operatingsystem == 'FreeBSD' {
        create_resources(librenms::fetch, {
                fbsdnfsserver => {
                use => $enabled,
        }})

        librenms::snmpd{'fbsdnfsserver':
            use    => $enabled,
            script => 'fbsdnfsserver',
        }
    } else {
        librenms::snmpd{'nfs-server':
            use      => $enabled,
            script   => $agent_script,
            template => 'nfs-server.conf_snmp.erb',
        }
    }
}

