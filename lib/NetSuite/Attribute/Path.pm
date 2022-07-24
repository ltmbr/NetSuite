package NetSuite::Attribute::Path;

use Moo::Role;

# attribute path
has path => (
    is     => 'ro',
    coerce => sub {
        $_[0] ? '/services/rest/record/v1/' . $_[0] : undef
    }
);

# attributes lazy
has valid_path => (
    is => 'lazy'
);

# valid path
sub _build_valid_path {
    my $self = shift;
    
    return unless defined $self->path;
    return unless $self->path =~ /^\/services\/rest\/record\/v1\/[A-Za-z]+$/x;
    
    return 1;
}

1;
