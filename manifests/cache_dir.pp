#
class librenms::cache_dir (
) inherits librenms::params {
    # global directory for data caching

    $snmpd_user = $librenms::params::snmpd_user

    file {'/var/cache/librenms':
        ensure => directory,
        owner  => $snmpd_user,
        group  => 'root',
        mode   => '0775',
    }
}
