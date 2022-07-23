package NetSuite::Request::List;

use Moo::Role;
use NetSuite::Header;

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
    my ($self) = @_;
    
    my $header = NetSuite::Header->new(
        parameters => {
            q      => $self->q,
            limit  => $self->limit,
            offset => $self->offset
        }
    );
}

1;
