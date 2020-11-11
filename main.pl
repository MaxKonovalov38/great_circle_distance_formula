#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig;

my $js_file = 'customers.json';
my $out_file = 'answer.json';

my $lat1d = 12.9611159;
my $lon1d = 77.6362214;

my $pi = 3.14159265358979323846;
my $earth_radius = 6371.0;

sub main {
	# Функция для чтения json, которая в дальнейшем
	# использует данные для логики программы  
	my $file = shift;

	open(my $fh, '<', $file) or die "Couldn't open myinfo: $!\n";

	while (my $line = <$fh>) {
		chomp($line);
		my $row_line = json_in_string($line);
		my %hash_data = arr_value($row_line);
		my $param = distance_earth( $hash_data{"latitude"}, $hash_data{"longitude"} );
		if ($param < 50) { final_convert( $out_file, $hash_data{"user_id"}, $hash_data{"name"} ) }
	}

	close($fh);
}

sub json_in_string {
	# Функция преобразует json в строку
	my $line = shift;

	$line =~ s/\}//;
	$line =~ s/\{//;
	$line =~ s/:/,/g;
	$line =~ s/ //g;
	$line =~ s/"//g;

	return $line;
}

sub arr_value {
	# Функция преобразует строку в массив,
	# а массив уже преобразуется в хеш
	my $s = shift;
	my %hash_val;
	my $n = 0;

	my @data = split( /,/, $s);

	while ($n<scalar(@data)) {
		$hash_val{$data[$n]} = $data[$n+1];
		$n+=2;
	}

	return %hash_val;
}

sub distance_earth {
	# Функция для вычисления расстояния между двумя
	# заданными локациями, используя GCDF
	my ($lat2d, $lon2d) = @_;

	my $lat1 = degtorad($lat1d);
	my $lon1 = degtorad($lon1d);
	my $lat2 = degtorad($lat2d);
	my $lon2 = degtorad($lon2d);

	my $delta_lon = $lon2 - $lon1;

	my $central_ang = acos( sin($lat1) * sin($lat2) + cos($lat1) * cos($lat2) * cos($delta_lon) );

	return ($earth_radius * $central_ang);
}

sub degtorad {
	# Функция преобразования грудусов в радиан
	my $deg = shift;

	return ($deg * $pi / 180);
}

sub final_convert {
	# Функция записывает в json параметры
	my ($js_file, $id, $name) = @_;

	open(my $fh, '>>', $js_file) or die "Couldn't open myinfo: $!\n";
	print $fh "{\"user_id\": $id, \"name\": \"$name\"}\n";
	
	close($fh);
}

main($js_file);