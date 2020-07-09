class librenms::applications::fail2ban (
  Boolean $enabled = true,
  Boolean $cache = true,
) inherits librenms::params {

    if $enabled {
        $file_existance = 'present'
    } else {
        $file_existance = 'absent'
    }

    if $cache {
      $script_args = '-c -U'
    } else {
      $script_args = ''
    }

    create_resources(librenms::fetch, {
            'fail2ban' => {
            use => $enabled,
    }})

    librenms::snmpd{'fail2ban':
        use         => $enabled,
        script      => 'fail2ban',
        script_args => ''
    }
}

