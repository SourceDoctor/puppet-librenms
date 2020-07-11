class librenms::applications::nfs_client (
  Boolean $enabled = true,
) inherits librenms::params {

    if $::operatingsystem == 'FreeBSD' {
        create_resources(librenms::fetch, {
                fbsdnfsclient => {
                use => $enabled,
        }})

        librenms::snmpd{'fbsdnfsclient':
            use     => $enabled,
            script  => 'fbsdnfsclient',
        }
    } else {
        notice{'No Linux Version of NFS-Client present':
        }
    }
}

