# == Class: cups_client::client::config
#
# Puppet class to configure CUPS client.
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
class cups_client::client::config inherits cups_client::client {

	$confdir = dirname($::cups_client::params::client_conf)
	file { $confdir:
		ensure		=> directory,
		owner		=> 'root',
		group		=> 'lp',
		mode		=> '0755',
	}->
	file { $::cups_client::params::client_conf:
		ensure		=> present,
		owner		=> 'root',
		group		=> 'root',
		mode		=> '0644',
		content		=> template("${module_name}/client.conf.erb"),
	}

}
