# == Class: cups_client::params
#
# Puppet class to set parameters.
#
# === Parameters
#
# === Authors
#
# Peter Wienemann <wienemann@physik.uni-bonn.de>
#
# === Copyright
#
# Copyright 2016 University of Bonn
#
class cups_client::params {

	if $::osfamily != 'RedHat' and $::osfamily != 'Debian' {
		fail('The CUPS module does not support your OS family')
	}

	$client_package_name 	= 'cups-client'
	$client_conf 		= '/etc/cups/client.conf'

}
