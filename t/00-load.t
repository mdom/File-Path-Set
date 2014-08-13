#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'File::Path::Set' );
}

diag( "Testing File::Path::Set $File::Path::Set::VERSION, Perl $], $^X" );
