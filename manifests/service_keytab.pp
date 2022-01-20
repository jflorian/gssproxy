#
# == Define: gssproxy::service_keytab
#
# Manages a service keytab file for the gssproxy service.
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


define gssproxy::service_keytab (
        Ddolib::File::Ensure    $ensure='present',
        Optional[String[1]]     $content=undef,
        String[1]               $filename=$title,
        Optional[String[1]]     $source=undef,
    ) {

    file { "${gssproxy::config_dir}/${filename}.keytab":
        ensure    => $ensure,
        owner     => 'root',
        group     => 'root',
        mode      => '0400',
        seluser   => 'system_u',
        selrole   => 'object_r',
        seltype   => 'etc_t',
        content   => $content,
        source    => $source,
        show_diff => false,
        require   => Package[$gssproxy::packages],
        before    => Service[$gssproxy::services],
        notify    => Service[$gssproxy::services],
    }

}
