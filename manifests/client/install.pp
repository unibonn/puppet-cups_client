# == Class: cups::client::install
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
class cups::client::install {

	if $::cups::client::package_name {
		if !defined(Package[$::cups::client::package_name]) {
			package { $::cups::client::package_name:
				ensure	=> $::cups::client::package_ensure,
			}
		}
	}

}
