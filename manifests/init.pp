#
# == Class: gssproxy
#
# Manages the gssproxy service.
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# This file is part of the doubledog-gssproxy Puppet module.
# Copyright 2022 John Florian
# SPDX-License-Identifier: GPL-3.0-or-later


class gssproxy (
        Array[String[1], 1]     $packages,
        Array[String[1], 1]     $services,
        Boolean                 $enable,
        Ddolib::Service::Ensure $ensure,
        Integer[0]              $debug_level,
        Stdlib::Absolutepath    $client_dir,
        Hash[String[1], Hash]   $client_keytabs,
        Stdlib::Absolutepath    $config_dir,
        Hash[String[1], Hash]   $service_configs,
        Hash[String[1], Hash]   $service_keytabs,
    ) {

    package { $packages:
        ensure => installed,
    }

    -> file {
        default:
            owner   => 'root',
            group   => 'root',
            mode    => '0600',
            seluser => 'system_u',
            selrole => 'object_r',
            seltype => 'etc_t',
            ;
        "${gssproxy::config_dir}//gssproxy.conf":
            content => template('gssproxy/gssproxy.conf.erb'),
            notify  => Service[$services],
            ;
    }

    -> service { $services:
        ensure     => $ensure,
        enable     => $enable,
        hasrestart => true,
        hasstatus  => true,
    }

    create_resources('gssproxy::client_keytab', $client_keytabs)
    create_resources('gssproxy::service_config', $service_configs)
    create_resources('gssproxy::service_keytab', $service_keytabs)

}
