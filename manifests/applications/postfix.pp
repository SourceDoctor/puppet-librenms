class librenms::applications::postfix (
  Boolean $enabled = true,
) inherits librenms::params {

    create_resources(librenms::fetch, {
            'postfix-queues' => {
            use => $enabled,
    }})

    create_resources(librenms::fetch, {
            'postfixdetailed' => {
            use => $enabled,
    }})

    librenms::snmpd{'mailq':
        use    => $enabled,
        script => 'postfix-queues'
    }

    librenms::snmpd{'postfixdetailed':
        use    => $enabled,
        script => 'postfixdetailed'
    }
}

