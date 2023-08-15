class librenms (
  Boolean $use_local_agents = true,
  String $snmpd_dir = $librenms::params::snmpd_dir
  String $snmpd_extend_dir = $librenms::params::snmpd_extend_dir
  String $sudo_bin = $librenms::params::sudo_bin

) inherits librenms::params {

  ensure_packages([$librenms::params::snmpd_package, $librenms::params::sudo_package],
                  {ensure => present})

}
