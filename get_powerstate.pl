#!/usr/bin/perl
use strict;
use warnings;
use VMware::VIRuntime;
use VMware::VILib;
Opts::parse();
Opts::validate();

Util::connect();

my $vm_views = Vim::find_entity_views(
	view_type => 'VirtualMachine',
	filter => {
		'runtime.powerState' => 'poweredOn'
	}
		);

foreach my $vm (@$vm_views) {
	$vm->update_view_data();
	if ($vm->runtime->powerState->val eq 'poweredOn') {
		print "VM " . $vm->name . "is on.\n";
	} else {
		print " VM " . $vm->name . "is off.\n";
	}
}

Vim::logout();
