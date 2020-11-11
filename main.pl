#!/usr/bin/perl
use strict;
use warnings;

my $js_file = 'customers.json';
my $out_file = 'answer.json';

my $lat_cl = 12.9611159;
my $lon_cl = 77.6362214;
my $pi = 3.14159265358979323846;
my $earth_radius = 6371.0;

sub convert_js {
	my $file = shift;

	open(my $fh, '<', $file) or die "Couldn't open myinfo: $!\n";

	while (my $line = <$fh>) {
		chomp($line);
		$line =~ s/\}//;
		$line =~ s/\{//;
		$line =~ s/:/,/g;
		print $line, "\n";
		last;
	}

	close($fh);
}

convert_js($js_file);