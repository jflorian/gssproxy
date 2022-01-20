<!--
This file is part of the doubledog-gssproxy Puppet module.
Copyright 2022 John Florian <jflorian@doubledog.org>
SPDX-License-Identifier: GPL-3.0-or-later
-->

# gssproxy

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with gssproxy](#setup)
    * [What gssproxy affects](#what-gssproxy-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with gssproxy](#beginning-with-gssproxy)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
    * [Defined types](#defined-types)
    * [Data types](#data-types)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module lets you manage the gssproxy service.

## Setup

### What gssproxy Affects

### Setup Requirements

### Beginning with gssproxy

## Usage

## Reference

**Classes:**

* [gssproxy](#gssproxy-class)

**Defined types:**

* [gssproxy::client\_keytab](#gssproxyclient_keytab-defined-type)
* [gssproxy::service\_config](#gssproxyservice_config-defined-type)
* [gssproxy::service\_keytab](#gssproxyservice_keytab-defined-type)

**Data types:**

* [Gssproxy::ServiceName](#gssproxyservicename-data-type)


### Classes

#### gssproxy class

This class manages the package deployment.

##### `packages` (required)
An array of package names needed for the gssproxy installation.  The default should be correct for supported platforms.

##### `services` (required)
An array of service names that comprise the gssproxy installation.  The default should be correct for supported platforms.

##### `debug_level`
Detail level at which to log debugging messages.  `0` corresponds to no logging, while `1` turns on basic debug logging.  Level `2` increases verbosity, including more detailed credential verification.  At level `3` and above, KRB5_TRACE output is logged.

##### `client_dir`
Absolute path where client keytab files are to be deployed.

##### `client_keytabs`
A hash whose keys are keytab filenames and whose values are hashes comprising the same parameters you would otherwise pass to the [gssproxy::client\_keytab](#gssproxyclient_keytab-defined-type) defined type.  The default is to deploy none.

##### `config_dir`
Absolute path where service configuration/keytab files are to be deployed.

##### `service_configs`
A hash whose keys are service names and whose values are hashes comprising the same parameters you would otherwise pass to the [gssproxy::service\_config](#gssproxyservice_config-defined-type) defined type.  The default is to deploy none.

##### `service_keytabs`
A hash whose keys are keytab filenames and whose values are hashes comprising the same parameters you would otherwise pass to the [gssproxy::service\_keytab](#gssproxyservice_keytab-defined-type) defined type.  The default is to deploy none.


### Defined types

#### gssproxy::client\_keytab defined type

This defined type manages a client keytab file for the gssproxy service.

##### `namevar` (required)
An arbitrary identifier for the file instance unless the *filename* parameter is not set in which case this must provide the value normally set with the *filename* parameter.

##### `content`, `source`
Literal content for the file or a source URI that provides the same.  If neither *content* nor *source* is given, the content of the file will be left unmanaged.

##### `ensure`
Instance is to be `'present'` (default) or `'absent'`.  Alternatively, a Boolean value may also be used with `true` equivalent to `'present'` and `false` equivalent to `'absent'`.

##### `filename`
Name to be given to the client keytab file, without any path details nor a `.keytab` suffix.  This may be used in place of *namevar* if it's beneficial to give *namevar* an arbitrary value.


#### gssproxy::service\_config defined type

This defined type manages a drop-in service configuration file for the gssproxy service.

##### `namevar` (required)
An arbitrary identifier for the file instance unless the *service_name* parameter is not set in which case this must provide the value normally set with the *service_name* parameter.

##### `content`, `source`
Literal content for the file or a source URI that provides the same.  If neither *content* nor *source* is given, the content of the file will be left unmanaged.

##### `ensure`
Instance is to be `'present'` (default) or `'absent'`.  Alternatively, a Boolean value may also be used with `true` equivalent to `'present'` and `false` equivalent to `'absent'`.

##### `service_name`
Name to be given to the drop-in service configuration file, without any path details nor a `.conf` suffix.  Specifically, the value must conform to the [Gssproxy::ServiceName](#gssproxyservicename-data-type) data type.  This may be used in place of *namevar* if it's beneficial to give *namevar* an arbitrary value.


#### gssproxy::service\_keytab defined type

This defined type manages a service keytab file for the gssproxy service.

##### `namevar` (required)
An arbitrary identifier for the file instance unless the *filename* parameter is not set in which case this must provide the value normally set with the *filename* parameter.

##### `content`, `source`
Literal content for the file or a source URI that provides the same.  If neither *content* nor *source* is given, the content of the file will be left unmanaged.

##### `ensure`
Instance is to be `'present'` (default) or `'absent'`.  Alternatively, a Boolean value may also be used with `true` equivalent to `'present'` and `false` equivalent to `'absent'`.

##### `filename`
Name to be given to the service keytab file, without any path details nor a `.keytab` suffix.  This may be used in place of *namevar* if it's beneficial to give *namevar* an arbitrary value.


### Data types

#### `Gssproxy::ServiceName` data type

Matches acceptable values for naming gssproxy drop-in configuration files.  Valid values are strings beginning with two digits and a dash, followed by one or more characters consisting only of digits, letters and the underscore character.  The two-digit prefix affects the order in which gssproxy will read the drop-in configuration files.


## Development

Contributions are welcome via pull requests.  All code should generally be compliant with puppet-lint.
