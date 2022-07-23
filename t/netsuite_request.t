use strict;
use warnings;
use Test::More;
use NetSuite::Request;

my $netsuite_request = NetSuite::Request->new;
is(ref($netsuite_request), 'NetSuite::Request', 'Test NetSuite::Request ref');

done_testing;
