package NetSuite::Signature;

use Moo;
use URI::Escape;
use NetSuite qw/hash_to_query_string/;

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

# attribute parameters
has parameters => (
    is      => 'ro',
    default => sub { {} }
);

# attribute timestamp
has timestamp => (
    is => 'ro'
);

sub signature {
    my $self = shift;
    
    return;
}

sub _data {
    my $self = shift;

    my $query_string = hash_to_query_string($self->parameters);
    
    my $data = $self->method;
    $data   .= '&' . uri_escape($self->url);
    $data   .= '&' . uri_escape($query_string);
    
    return $data;
}

sub _key {
    my $self = shift;
    
    return $self->consumer_secret . '&' . $self->token_secret;
}

1;
