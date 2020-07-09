class librenms (
  Boolean $use_local_agents = true,
) inherits librenms::params {

  ensure_packages([$librenms::params::snmpd_package, $librenms::params::sudo_package],
                  {ensure => present})

}
