package NetSuite::Attribute::ConsumerSecret;

use Moo::Role;
use NetSuite::Util qw/valid_token/;

# attribute consumer secret
has consumer_secret => (
    is => 'ro'
);

# attributes lazy
has valid_consumer_secret => (
    is => 'lazy'
);

# valid consumer secret
sub _build_valid_consumer_secret {
    my $self = shift;
    
    return unless valid_token($self->consumer_secret);
    
    return 1;
}

1;
