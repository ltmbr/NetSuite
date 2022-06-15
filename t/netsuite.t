use strict;
use warnings;
use Test::More;
use NetSuite;

my $netsuite = NetSuite->new;
is(ref($netsuite), 'NetSuite', 'Test NetSuite ref');

done_testing;
