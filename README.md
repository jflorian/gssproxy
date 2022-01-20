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


### Defined types



### Data types

#### `Gssproxy::ServiceName` data type

Matches acceptable values for naming gssproxy drop-in configuration files.  Valid values are strings beginning with two digits and a dash, followed by one or more characters consisting only of digits, letters and the underscore character.  The two-digit prefix affects the order in which gssproxy will read the drop-in configuration files.


## Development

Contributions are welcome via pull requests.  All code should generally be compliant with puppet-lint.
