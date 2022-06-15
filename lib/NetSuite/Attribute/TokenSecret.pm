package NetSuite::Attribute::TokenSecret;

use Moo::Role;
use NetSuite::Util qw/valid_token/;

# attribute token secret
has token_secret => (
    is => 'ro'
);

# attributes lazy
has valid_token_secret => (
    is => 'lazy'
);

# valid token secret
sub _build_valid_token_secret {
    my $self = shift;
    
    return unless valid_token($self->token_secret);
    
    return 1;
}

1;
