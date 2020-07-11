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
    Boolean $mailcow_dockerized_postfix = false,
    Boolean $mailscanner = false,
    Boolean $mdadm = false,
    Boolean $memcached = false,
    Boolean $mysql = false,
    Boolean $ntp_client = false,
    Boolean $ntp_server = false,
    Boolean $nvidia = false,
    Boolean $open_grid_scheduler = false,
    Boolean $osupdate = false,
    Boolean $php_fpm = false,
    Boolean $powerdns = false,
    Boolean $powerdns_recursor = false,
    Boolean $postfix = false,
    Boolean $puppet_agent = false,
    Boolean $pureftpd = false,
    Boolean $redis = false,
    Boolean $sdfsinfo = false,
    Boolean $seafile = false,
    Boolean $smartmontools = false,
    Boolean $squid = false,
    Boolean $ups_apcups = false,
    Boolean $ups_nut = false,
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

    if $mailcow_dockerized_postfix {
        include librenms::applications::mailcow_dockerized_postfix
    }

    if $mailscanner {
        include librenms::applications::mailscanner
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

    if $nvidia {
        include librenms::applications::nvidia
    }

    if $ntp_client {
        include librenms::applications::ntp_client
    }

    if $ntp_server {
        include librenms::applications::ntp_server
    }

    if $open_grid_scheduler {
        include librenms::applications::open_grid_scheduler
    }

    if $osupdate {
        include librenms::applications::osupdate
    }

    if $php_fpm {
        include librenms::applications::php_fpm
    }

    if $powerdns {
        include librenms::applications::powerdns
    }

    if $powerdns_recursor {
        include librenms::applications::powerdns_recursor
    }

    if $postfix {
        include librenms::applications::postfix
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

    if $sdfsinfo {
        include librenms::applications::sdfsinfo
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

    if $ups_apcups {
        include librenms::applications::ups_apcups
    }

    if $ups_nut {
        include librenms::applications::ups_nut
    }

    include librenms::cache_dir

    include librenms::discovery
}
