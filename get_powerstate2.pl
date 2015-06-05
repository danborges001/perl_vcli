#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../";
use VMware::VIRuntime;

Opts::parse();
Opts::validate();

Util::connect();

my $vm_views = Vim::find_entity_views(view_type => 'VirtualMachine');

foreach my $vm (@$vm_views) {
		if ($vm->runtime->powerState->val eq 'poweredOn') {
			print "VM " . $vm->name . " is on. \n";
		} else {
			print "VM " . $vm->name . " is off. \n";
	}
}
Util::disconnect();
