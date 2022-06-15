use strict;
use warnings;
use Test::More;
use NetSuite::Signature;

my $netsuite_signature = NetSuite::Signature->new;
is(ref($netsuite_signature), 'NetSuite::Signature', 'Test NetSuite::Signature ref');

done_testing;
