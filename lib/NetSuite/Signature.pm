package NetSuite::Signature;

use Moo;
use URI::Escape;

with qw/
    NetSuite::Attribute::Realm
    NetSuite::Attribute::ConsumerKey
    NetSuite::Attribute::ConsumerSecret
    NetSuite::Attribute::TokenKey
    NetSuite::Attribute::TokenSecret
    NetSuite::Attribute::URL
/;

# attribute method
has method => (
    is => 'ro'
);

# attribute nonce
has nonce => (
    is => 'ro'
);

# attribute path info
has path_info => (
    is => 'ro'
);

# attribute parameters
has parameters => (
    is      => 'ro',
    default => { [] }
);

# attribute timestamp
has timestamp => (
    is => 'ro'
);

sub _data {
    my $self = shift;
    
    my $data = $self->method;
    $data   .= '&' . uri_escape($self->url . $self->path);
    $data   .= '&' . uri_escape($string);
    
    return $data;
}

sub _key {
    my $self = shift;
    
    return $self->consumer_secret . '&' . $self->token_secret;
}

1;
