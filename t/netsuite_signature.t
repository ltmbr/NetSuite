use strict;
use warnings;
use Test::More;
use URI::Escape;
use NetSuite::Signature;

my $netsuite_signature = NetSuite::Signature->new(
    consumer_secret => 'CONSUMER_SECRET_VALUE',
    token_secret    => 'TOKEN_SECRET_VALUE',    
    url             => 'https://9876543-sb1.suitetalk.api.netsuite.com/services/rest/record/v1/customer/123',
    method          => 'GET',
    parameters      => {
        oauth_consumer_key     => 'CONSUMER_KEY_VALUE',
        oauth_nonce            => 'asdfasdf',
        oauth_signature_method => 'HMAC-SHA256',
        oauth_timestamp        => '1234567890',
        oauth_token            => 'TOKEN_ID_VALUE',
        oauth_version          => '1.0',
        expandSubResources     => 'true'
    }
);

is(ref($netsuite_signature), 'NetSuite::Signature', 'Test NetSuite::Signature ref');
is(uri_unescape($netsuite_signature->signature), 'cId0B3hP0sFVQw/gjQ/P6YiOSx76u0WfyO8umOlq3gg=', 'Test if signature is equal');

done_testing;
