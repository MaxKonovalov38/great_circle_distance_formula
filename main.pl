#!/usr/bin/perl
use strict;
use warnings;

my $js_file = shift or die $!;
my $lat_cl = 12.9611159;
my $lon_cl = 77.6362214;
my $pi = 3.14159265358979323846;
my $earth_radius = 6371.0;
my $out_file = 'answer.json';

sub convert_js {
	my $file = shift;

	open(my $fh, '<', $file) or die "Couldn't open myinfo: $!\n";

	while (my $line = <$fh>) {
		$line =~ s/\}//;
		$line =~ s/\{//;
		$line =~ s/:/,/g;
		print $line;
		list_arr($line);
		last;
	}

	close($fh);
}

sub list_arr {
	my $data = shift;
	my @arr = split(/,/, $data);
	print "2-ok\n", scalar(@arr), "\n";
}

sub main {
	print "1-ok\n";
}

main();
convert_js($js_file);