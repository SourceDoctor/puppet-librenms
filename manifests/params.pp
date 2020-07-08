#
class librenms::params {
  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      case $::operatingsystemrelease {
        default: {
          $bind_user = 'bind'
          $bind_group = 'bind'

          $cat_bin = '/bin/cat'
          $curl_bin = '/usr/bin/curl'
          $env_bin = '/usr/bin/env'
          $ls_bin = '/bin/ls'
          $smartctl_bin = '/usr/sbin/smartctl'

          $snmpd_service = 'snmpd'
          $snmpd_user = 'Debian-snmp'
          $snmpd_dir = '/etc/snmp'
          $snmpd_extend_dir = '/etc/snmp/snmp.d'

          $sudo_bin = '/usr/bin/sudo'
          $sudo_dir = '/etc/sudoers.d'
        }
      }
    }
    default: {
      fail("no support yet for ${::operatingsystem}")
    }
  }
}
