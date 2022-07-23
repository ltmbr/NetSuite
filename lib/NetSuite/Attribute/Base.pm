package NetSuite::Attribute::Base;

use Moo::Role;

# attribute base
has base => (
    is => 'ro'
);

# attributes lazy
has valid_base => (
    is => 'lazy'
);

# valid base
sub _build_valid_base {
    my $self = shift;
    
    return unless defined $self->base;
    return unless ref $self->base eq 'NetSuite';
    
    return 1;
}

1;
