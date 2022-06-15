package NetSuite::Attribute::TokenKey;

use Moo::Role;
use NetSuite::Util qw/valid_token/;

# attribute token key
has token_key => (
    is => 'ro'
);

# attributes lazy
has valid_token_key => (
    is => 'lazy'
);

# valid token key
sub _build_valid_token_key {
    my $self = shift;
    
    return unless valid_token($self->token_key);
    
    return 1;
}

1;
