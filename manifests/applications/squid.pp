class librenms::applications::squid (
  String $snmp_community,

  Boolean $enabled = true,
) inherits librenms::params {

    librenms::snmpd{'squid':
        use      => $enabled,
        script   => '',
        template => 'librenms/squid.conf_snmp.erb',
        custom   => {snmp_community => $snmp_community},
    }
}

