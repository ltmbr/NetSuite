package NetSuite::Attribute::ConsumerKey;

use Moo::Role;
use NetSuite::Util qw/valid_token/;

# attribute consumer key
has consumer_key => (
    is => 'ro'
);

# attributes lazy
has valid_consumer_key => (
    is => 'lazy'
);

# valid consumer key
sub _build_valid_consumer_key {
    my $self = shift;
    
    return unless valid_token($self->consumer_key);
    
    return 1;
}

1;
