# == Class: cups_client::client::install
#
# Puppet class to install CUPS client package.
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
class cups_client::client::install {

	if $::cups_client::client::package_name {
		if !defined(Package[$::cups_client::client::package_name]) {
			package { $::cups_client::client::package_name:
				ensure	=> $::cups_client::client::package_ensure,
			}
		}
	}

}
