#!perl -T

use Test::More tests => 7;

BEGIN {
	use_ok( 'DBIx::Custom' );
	use_ok( 'DBIx::Custom::Basic' );
	use_ok( 'DBIx::Custom::MySQL' );
	use_ok( 'DBIx::Custom::Query' );
	use_ok( 'DBIx::Custom::Result' );
	use_ok( 'DBIx::Custom::SQL::Template' );
	use_ok( 'DBIx::Custom::SQLite' );
}

diag( "Testing DBIx::Custom $DBIx::Custom::VERSION, Perl $], $^X" );
