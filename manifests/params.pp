#
class librenms::params {
  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      case $::operatingsystemrelease {
        default: {
          $bind_user = 'bind'
          $bind_group = 'bind'

          $curl_package = 'curl'

          $cat_bin = '/bin/cat'
          $curl_bin = '/usr/bin/curl'

          $dhcpd_pools_package = 'dhcpd-pools'

          $env_bin = '/usr/bin/env'
          $ls_bin = '/bin/ls'

          $nvidia_smi_package = 'nvidia-smi'

          $perl_readbackwards_package = 'libfile-readbackwards-perl'

          $php_cli_package = 'php-cli'
          $php_mysql_package = 'php-mysql'

          $pflogsumm_package = 'pflogsumm'

          $python_urlgrabber_package = 'python-urlgrabber'
          $python_pycurl_package = 'python-pycurl'
          $python3_openssl_package = 'python3-openssl'
          $python3_requests_package = 'python3-requests'
          $python3_yaml_package = 'python3-yaml'

          $smartctl_bin = '/usr/sbin/smartctl'

          $snmpd_service = 'snmpd'
          $snmpd_user = 'Debian-snmp'
          $snmpd_dir = '/etc/snmp'
          $snmpd_extend_dir = '/etc/snmp/snmp.d'
          $snmpd_package = 'snmpd'

          $sudo_bin = '/usr/bin/sudo'
          $sudo_dir = '/etc/sudoers.d'
          $sudo_package = 'sudo'
        }
      }
    }
    default: {
      fail("no support yet for ${::operatingsystem}")
    }
  }
}
