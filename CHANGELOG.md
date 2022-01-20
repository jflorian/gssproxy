<!--
This file is part of the doubledog-gssproxy Puppet module.
Copyright 2022 John Florian
SPDX-License-Identifier: GPL-3.0-or-later

Template

## [VERSION] WIP
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

-->

# Change log

All notable changes to this project will be documented in this file.  The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [0.0.0] 2022-01-20
### Added
- `class['gssproxy']`
- management of the package
- management of the service
- management of the service's primary configuration file
- `type['Gssproxy::ServiceName']`
- `define['gssproxy::service_config']`
- dependency on `doubledog/ddolib`
- dependency on `puppetlabs/stdlib`
- `define['gssproxy::service_keytab']`
- `define['gssproxy::client_keytab']`
- example usage
