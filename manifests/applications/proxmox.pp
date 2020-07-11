class librenms::applications::proxmox (
  Boolean $enabled = true,
) inherits librenms::params {

    ensure_packages([$librenms::params::libpve_apiclient_perl_package], {ensure => present})

    create_resources(librenms::fetch, {
            'proxmox' => {
            use      => $enabled,
            base_url => 'http://raw.githubusercontent.com/librenms/librenms-agent/master/agent-local'
    }})

    librenms::snmpd{'proxmox':
        use     => $enabled,
        script  => 'proxmox',
        do_sudo => true,
    }
}

