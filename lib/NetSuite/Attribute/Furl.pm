package NetSuite::Attribute::Furl;

use Moo::Role;

# attribute furl
has furl => (
    is => 'ro'
);

# attributes lazy
has valid_furl => (
    is => 'lazy'
);

# valid furl
sub _build_valid_furl {
    my $self = shift;
    
    return unless defined $self->furl;
    return unless ref $self->furl eq 'Furl';
    
    return 1;
}
