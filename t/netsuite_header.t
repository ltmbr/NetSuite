use strict;
use warnings;
use Test::More;
use NetSuite::Header;

my $netsuite_header = NetSuite::Header->new(
    realm           => '9876543-sb1',
    consumer_key    => 'CONSUMER_KEY_VALUE',
    consumer_secret => 'CONSUMER_SECRET_VALUE',
    token_key       => 'TOKEN_ID_VALUE',
    token_secret    => 'TOKEN_SECRET_VALUE',    
    url             => 'https://9876543-sb1.suitetalk.api.netsuite.com/services/rest/record/v1/customer/123',
    method          => 'GET',
    parameters      => {
        expandSubResources => 'true'
    }    
);

is(ref($netsuite_header), 'NetSuite::Header', 'Test NetSuite::Header ref');

my @header = split /,/, $netsuite_header->header;
is($header[0], 'OAuth realm="9876543_SB1"', 'Test realm value');
is($header[1], 'oauth_consumer_key="CONSUMER_KEY_VALUE"', 'Test consumer_key value');
is($header[2], 'oauth_token="TOKEN_ID_VALUE"', 'Test token_key value');
is($header[3], 'oauth_signature_method="HMAC-SHA256"', 'Test signature_method value');
like($header[4], qr/oauth_timestamp="\d+"/, 'Test timestamp value');
like($header[5], qr/oauth_nonce="\w+"/, 'Test nonce value');
like($header[6], qr/oauth_version="1.0"/, 'Test version value');
like($header[7], qr/oauth_signature="[\w%]+"/, 'Test signature value');

done_testing;
