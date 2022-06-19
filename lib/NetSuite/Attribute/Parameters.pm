package NetSuite::Attribute::Parameters;

use Moo::Role;

# attribute parameters
has parameters => (
    is      => 'ro',
    default => sub { {} }
);

# attributes lazy
has valid_parameters => (
    is => 'lazy'
);

# valid parameters
sub _build_valid_parameters {
    my $self = shift;
    
    return unless defined $self->parameters;
    return unless ref($self->parameters) eq 'HASH';
    
    return 1;
}

1;
