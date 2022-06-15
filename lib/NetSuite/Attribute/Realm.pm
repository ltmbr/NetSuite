package NetSuite::Attribute::Realm;

use Moo::Role;

# attribute realm
has realm => (
    is => 'ro'
);

# attributes lazy
has valid_realm => (
    is => 'lazy'
);

# valid realm
sub _build_valid_realm {
    my $self = shift;
    
    return unless defined $self->realm;
    return unless $self->realm =~ /^[0-9a-z-]+$/x;
    
    return 1;
}

1;
