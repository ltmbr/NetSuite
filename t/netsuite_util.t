use strict;
use warnings;
use Test::More;
use NetSuite::Util qw/
    hash_to_query_string
    query_string_to_hash
    nonce
    timestamp
    valid_token
/;

like(nonce, qr/^[0-9a-zA-Z]{20}$/x, 'Test nonce return');

my $hash = query_string_to_hash('?name=Lucas&age=34');
is($hash->{name}, 'Lucas', 'Test name parameter');
is($hash->{age}, 34, 'Test age parameter');

my $hash2 = query_string_to_hash;
ok(!$hash2, 'Test query string empty');

my $query_string = hash_to_query_string($hash);
is($query_string, 'age=34&name=Lucas', 'Test query string');

is(timestamp, time, 'Test return timestamp');

is(valid_token('4efc02ac34078c22ee7118c1e4e3e6ee2ec41a349ba8a9eb25590be9ccece99a'), 1, 'Test to valid if token have 64 characters');

done_testing;
