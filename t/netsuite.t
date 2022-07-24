use strict;
use warnings;
use Test::More;
use NetSuite;

my $netsuite = NetSuite->new(
    realm           => '1234567-sb8',
    consumer_key    => '1e4e3e6eaa9eb25598cc14e2e34079a8c22ee71c41cea3ece90be9c49ba8fc02',
    consumer_secret => 'ea3ece90be9c49ba8fc02aa9eb25598c1e4e3e6ec14e2e34079a8c22ee71c41c',
    token_key       => '2ce90be9c49b2eee4e3e6eaa9eb25598c71c41cec14e2e34a3ea8fc021079a8c',
    token_secret    => '49ba8fc02a591e4e3e6ec14e2e34ea90e9c8c079a8c22ea9eb3ece25e71c41cb'
);

is(ref($netsuite), 'NetSuite', 'Test NetSuite ref');

my %headers = @{${$netsuite->furl}->{headers}};
is($headers{'User-Agent'}, 'Perl-NetSuite', 'Test user agent default');

is(${$netsuite->furl}->{timeout}, 20, 'Test timeout default');

$netsuite->transaction('AssemblyItem')->list;

done_testing;
