package NetSuite::Request::List;

use Moo::Role;
use NetSuite::Header;

# attribute limit
has limit => (
    is      => 'ro',
    default => 20
);

# attribute offset
has offset => (
    is      => 'ro',
    default => 0
);

sub list {
    my $self = shift;
    
    my $url = $self->base->url . $self->path_info;
    
    my $header = NetSuite::Header->new(
        realm           => $self->base->realm,
        consumer_key    => $self->base->consumer_key,
        consumer_secret => $self->base->consumer_secret,
        token_key       => $self->base->token_key,
        token_secret    => $self->base->token_secret,
        method          => 'GET',
        url             => $url,
        parameters      => {
            q      => $self->q,
            limit  => $self->limit,
            offset => $self->offset
        }
    );
    
    my $query_string;
        
    my $response = $self->base->furl->get(
        $url
    );
}

1;
