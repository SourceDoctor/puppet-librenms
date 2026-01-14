class librenms::applications::zfs (
  Boolean $enabled = true,
) inherits librenms::params {

    if $facts['os']['name'] == 'FreeBSD' {
        $agent_script = 'zfs-freebsd'
        $do_sudo = false
    } else {
        $agent_script = 'zfs-linux'
        $do_sudo = true
    }

    create_resources(librenms::fetch, {
            $agent_script => {
            use => $enabled,
    }})

    librenms::snmpd{'zfs':
        use     => $enabled,
        script  => $agent_script,
        do_sudo => $do_sudo,
    }
}

