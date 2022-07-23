use strict;
use warnings;
use Test::More;
use lib './t';
use Test::Request;

my $test_request = Test::Request->new;

ok($test_request->can('List'), 'Test if method list exists!');

done_testing;
