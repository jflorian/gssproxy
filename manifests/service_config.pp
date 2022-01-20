#
# == Define: gssproxy::service_config
#
# Manages a drop-in service configuration file for the gssproxy service.
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


define gssproxy::service_config (
        Ddolib::File::Ensure    $ensure='present',
        Optional[String[1]]     $content=undef,
        Gssproxy::ServiceName   $service_name=$title,
        Optional[String[1]]     $source=undef,
    ) {

    file { "${gssproxy::config_dir}/${service_name}.conf":
        ensure  => $ensure,
        owner   => 'root',
        group   => 'root',
        mode    => '0600',
        seluser => 'system_u',
        selrole => 'object_r',
        seltype => 'etc_t',
        content => $content,
        source  => $source,
        require => Package[$gssproxy::packages],
        before  => Service[$gssproxy::services],
        notify  => Service[$gssproxy::services],
    }

}
