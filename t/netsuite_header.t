use strict;
use warnings;
use Test::More;
use NetSuite::Header;

my $netsuite_header = NetSuite::Header->new;
is(ref($netsuite_header), 'NetSuite::Header', 'Test NetSuite::Header ref');

done_testing;
