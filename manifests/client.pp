# == Class: cups::client
#
# Puppet class to configure CUPS client.
#
# === Parameters
#
# A more detailed description of the CUPS client parameters can be obtained from
# https://www.cups.org/documentation.php/doc-2.1/man-client.conf.html
#
# [*package_name*]
#   Name of CUPS client package
#
# [*package_ensure*]
#   State the CUPS client package should be in (default: installed)
#
# [*allow_any_root*]
#   Allow certificates issued by untrusted CAs (default: undef)
#
# [*allow_expired_certs*]
#   Allow expired certificates (default: undef)
#
# [*encryption*]
#   When should encryption be used (default: IfRequested)
#
# [*gss_service_name*]
#   Service name in the Kerberos service principal used by CUPS server (default: undef)
#
# [*server_name*]
#   Hostname or IP address of the CUPS server (default: undef). Optionally a port can
#   be added separated from the hostname/IP address by a colon.
#
# [*ssl_options*]
#   Set SSL/TLS options (default: undef)
#
# [*user*]
#   The default user name used for requests
#
# [*validate_certs*]
#   Should certificate DNs match hostname (default: undef)
#
# === Examples
#
#  class { '::cups':
#    server_name => 'cups.example.com',
#  }
#
# === Authors
#
# Peter Wienemann <wienemann@physik.uni-bonn.de>
#
# === Copyright
#
# Copyright 2016 University of Bonn
#
class cups::client (
	$package_name		= $::cups::params::client_package_name,
	$package_ensure		= 'installed',
	$allow_any_root 	= undef,
	$allow_expired_certs 	= undef,
	$encryption		= 'IfRequested',
	$gss_service_name	= undef,
	$server_name		= undef,
	$ssl_options		= undef,
	$user			= undef,
	$validate_certs		= undef,
) inherits cups::params {

	if $allow_any_root {
		validate_re($allow_any_root, [ '^Yes$', '^No$' ])
	}
	if $allow_expired_certs {
		validate_re($allow_expired_certs, [ '^Yes$', '^No$' ])
	}
	validate_re($encryption, [ '^IfRequested$', '^Never$', '^Required$' ])
	if $gss_service_name {
		validate_string($gss_service_name)
	}
	validate_string($server_name)
	if $ssl_options {
		validate_re($ssl_options, [ '^AllowDH$', '^AllowRC4$', '^AllowSSL3$', '^DenyTLS1\.0$' ])
	}
	if $user {
		validate_string($user)
	}
	if $validate_certs {
		validate_re($validate_certs, [ '^Yes$', '^No$' ])
	}

	class { '::cups::client::install': } ->
	class { '::cups::client::config': }

}
