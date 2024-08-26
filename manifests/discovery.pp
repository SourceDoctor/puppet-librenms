#
class librenms::discovery(
    Boolean $enabled = false,
    String $librenms_server = '',
    String $api_token = '',
    Enum['http', 'https'] $transport_protocol = 'http',
) inherits librenms::params {

    ensure_packages([$librenms::params::curl_package], {ensure => present})

    $curl_bin = $librenms::params::curl_bin

    if $enabled {
        exec {'trigger_discovery':
            command     => "${curl_bin} -s -L -H 'X-Auth-Token: ${api_token}' ${transport_protocol}://${librenms_server}/api/v0/devices/${facts['fqdn']}/discover",
            refreshonly => true,
        }
    } else {
        exec {'trigger_discovery':
            command     => "/bin/true",
            refreshonly => true,
        }
    }
}
