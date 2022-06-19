use strict;
use warnings;
use Test::More;
use lib './t';
use Test::Attribute;

my $test_attribute = Test::Attribute->new(
    realm           => '1234567-sb8',
    consumer_key    => '1e4e3e6eaa9eb25598cc14e2e34079a8c22ee71c41cea3ece90be9c49ba8fc02',
    consumer_secret => 'ea3ece90be9c49ba8fc02aa9eb25598c1e4e3e6ec14e2e34079a8c22ee71c41c',
    token_key       => '2ce90be9c49b2eee4e3e6eaa9eb25598c71c41cec14e2e34a3ea8fc021079a8c',
    token_secret    => '49ba8fc02a591e4e3e6ec14e2e34ea90e9c8c079a8c22ea9eb3ece25e71c41cb',
    url             => 'https://1234567-sb8.suitetalk.api.netsuite.com',
    method          => 'GET',
    parameters      => {
        expandSubResources => 'false'
    }
);

ok($test_attribute->valid_realm, 'Test method valid_realm');
is($test_attribute->realm, '1234567-sb8', 'Test if attribute realm is equal');

ok($test_attribute->valid_consumer_key, 'Test method valid_consumer_key');
is($test_attribute->consumer_key, '1e4e3e6eaa9eb25598cc14e2e34079a8c22ee71c41cea3ece90be9c49ba8fc02', 'Test if attribute consumer_key is equal');

ok($test_attribute->valid_consumer_secret, 'Test method valid_consumer_secret');
is($test_attribute->consumer_secret, 'ea3ece90be9c49ba8fc02aa9eb25598c1e4e3e6ec14e2e34079a8c22ee71c41c', 'Test if attribute consumer_secret is equal');

ok($test_attribute->valid_token_key, 'Test method valid_token_key');
is($test_attribute->token_key, '2ce90be9c49b2eee4e3e6eaa9eb25598c71c41cec14e2e34a3ea8fc021079a8c', 'Test if attribute token_key is equal');

ok($test_attribute->valid_token_secret, 'Test method valid_token_secret');
is($test_attribute->token_secret, '49ba8fc02a591e4e3e6ec14e2e34ea90e9c8c079a8c22ea9eb3ece25e71c41cb', 'Test if attribute token_secret is equal');

ok($test_attribute->valid_url, 'Test method url');
is($test_attribute->url, 'https://1234567-sb8.suitetalk.api.netsuite.com', 'Test if attribute url is equal');

ok($test_attribute->valid_method, 'Test method valid_method');
is($test_attribute->method, 'GET', 'Test if attribute method is equal');

ok($test_attribute->valid_parameters, 'Test method valid_parameters');
is($test_attribute->parameters->{expandSubResources}, 'false', 'Test if hash expandSubResources is equal');

done_testing;
