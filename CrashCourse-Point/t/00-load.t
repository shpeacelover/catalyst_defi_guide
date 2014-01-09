#! /usr/bin/env perl
##!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

#qw/no_plan/;
#plan tests => 1;

BEGIN {
    use_ok( 'CrashCourse::Point' ) || print "Bail out!\n";
}

diag( "Testing CrashCourse::Point $CrashCourse::Point::VERSION, Perl $], $^X" );

my $point = CrashCourse::Point->new( x=> 1, y => 2);
print "Coordinates are ",
        $point->x , "," ,
		$point->y , "\n";

$point->clear;
print "Coordinates are ", $point->x , "," ,$point->y , "\n";
