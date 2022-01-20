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
    ) {

    package { $packages:
        ensure => installed,
    }

    -> service { $services:
        ensure     => $ensure,
        enable     => $enable,
        hasrestart => true,
        hasstatus  => true,
    }

}
