use strict;
use warnings;
use Test::More;
use NetSuite;

my $netsuite = NetSuite->new;
is(ref($netsuite), 'NetSuite', 'Test NetSuite ref');

my %headers = @{${$netsuite->furl}->{headers}};
is($headers{'User-Agent'}, 'Perl-NetSuite', 'Test user agent default');

is(${$netsuite->furl}->{timeout}, 20, 'Test timeout default');

done_testing;
