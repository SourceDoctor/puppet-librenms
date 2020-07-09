#
class librenms::application (
    Boolean $apache2 = false,
    Boolean $asterisk = false,
    Boolean $backupninja = false,
    Boolean $bind = false,
    Boolean $certificate = false,
    Boolean $dhcp = false,
    Boolean $distribution = false,
    Boolean $entropy = false,
    Boolean $exim = false,
    Boolean $fail2ban = false,
    Boolean $freeradius = false,
    Boolean $freeswitch = false,
    Boolean $gpsd = false,
    Boolean $mdadm = false,
    Boolean $memcached = false,
    Boolean $mysql = false,
    Boolean $ntp_server = false,
    Boolean $osupdate = false,
    Boolean $puppet_agent = false,
    Boolean $pureftpd = false,
    Boolean $redis = false,
    Boolean $seafile = false,
    Boolean $smartmontools = false,
    Boolean $squid = false,
){

    # https://docs.librenms.org/Extensions/Applications/

    if $apache2 {
        include librenms::applications::apache2
    }

    if $asterisk {
        include librenms::applications::asterisk
    }

    if $backupninja {
        include librenms::applications::backupninja
    }

    if $bind {
        include librenms::applications::bind
    }

    if $certificate {
        include librenms::applications::certificate
    }

    if $dhcp {
        include librenms::applications::dhcp
    }

    if $distribution {
        include librenms::applications::distribution
    }

    if $entropy {
        include librenms::applications::entropy
    }

    if $exim {
        include librenms::applications::exim
    }

    if $fail2ban {
        include librenms::applications::fail2ban
    }

    if $freeradius {
        include librenms::applications::freeradius
    }

    if $freeswitch {
        include librenms::applications::freeswitch
    }

    if $gpsd {
        include librenms::applications::gpsd
    }

    if $mdadm {
        include librenms::applications::mdadm
    }

    if $memcached {
        include librenms::applications::memcached
    }

    if $mysql {
        include librenms::applications::mysql
    }

    if $ntp_server {
        include librenms::applications::ntp_server
    }

    if $osupdate {
        include librenms::applications::osupdate
    }

    if $puppet_agent {
        include librenms::applications::puppet_agent
    }

    if $pureftpd {
        include librenms::applications::pureftpd
    }

    if $redis {
        include librenms::applications::redis
    }

    if $seafile {
        include librenms::applications::seafile
    }

    if $smartmontools {
        include librenms::applications::smartmontools
    }

    if $squid {
        include librenms::applications::squid
    }

    include librenms::cache_dir

    include librenms::discovery
}
