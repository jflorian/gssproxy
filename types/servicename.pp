#
# == Type: gssproxy::servicename
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


type Gssproxy::ServiceName = Pattern[/\d\d-\w+/]
