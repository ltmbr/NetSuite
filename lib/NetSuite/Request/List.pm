package NetSuite::Request::List;

use Moo::Role;
use NetSuite::Header;
use Data::Dump qw/dump/;

# attribute q
has q => (
    is      => 'ro',
    default => ''
);

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
    my ($self, $path) = @_;
    
    my $header = NetSuite::Header->new(
        parameters => {
            q      => $self->q,
            limit  => $self->limit,
            offset => $self->offset
        }
    );
    
    my $query_string;
        
    my $response = $self->base->furl->get(
        $self->base->url . $self->path
    );
}

1;
