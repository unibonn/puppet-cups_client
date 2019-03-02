# cups_client

#### Table of Contents

1. [Module Description](#module-description)
2. [Usage](#usage)
3. [Limitations](#limitations)

## Module Description

WARNING: This module is deprecated and going to be removed.

The cups modules allows to install and configure the CUPS printing system. At the moment only client configuration is handled.

It installs CUPS client packages and sets up the /etc/cups/client.conf file.

## Usage

A minimal working example looks like this:

```puppet
class { '::cups_client::client':
    server_name         => 'cups.example.com',
}
```

A more complicated example is:
```puppet
class { '::cups_client::client':
    server_name         => 'cups.example.com',
    package_ensure      => 'latest',
    encryption          => 'Required',
    allow_any_root      => 'No',
    allow_expired_certs => 'No',
    validate_certs      => 'Yes'
}
```

Allowed parameters are:

##### `server_name`

Hostname or IP address of the CUPS server (default: undef). Optionally a port can be added separated from the hostname/IP address by a colon.

##### `package_name` (optional)

Name of CUPS client package

##### `package_ensure` (optional)

State the CUPS client package should be in (default: installed)

##### `allow_any_root` (optional)

Allow certificates issued by untrusted CAs (default: undef). Allowed values are 'Yes' and 'No'.

##### `allow_expired_certs`

Allow expired certificates (default: undef). Allowed values are 'Yes' and 'No'.

##### `encryption` (optional)

When should encryption be used (default: IfRequested). Allowed values are 'IfRequested', 'Never' and 'Required'.

##### `gss_service_name` (optional)

Service name in the Kerberos service principal used by CUPS server (default: undef)

##### `ssl_options` (optional)

Set SSL/TLS options (default: undef). Allowed values are 'AllowDH', 'AllowRC4', 'AllowSSL3' and 'DenyTLS1.0'.

##### `user` (optional)

The default user name used for requests

##### `validate_certs` (optional)

Should certificate DNs match hostname (default: undef). Allowed values are 'Yes' and 'No'.

More information on the meaning of CUPS client.conf parameters can be obtained from the [CUPS documentation pages](https://www.cups.org/documentation.php/doc-2.1/man-client.conf.html).

## Limitations

This module is so far only tested on OSes of the Debian family, but it should also work on RedHat based systems.
