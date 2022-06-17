package NetSuite::Attribute::Method;

use Moo::Role;

# attribute method
has method => (
    is => 'ro'
);

# attributes lazy
has valid_method => (
    is => 'lazy'
);

# valid method
sub _build_valid_method {
    my $self = shift;
    
    return unless defined $self->method;
    return unless $self->method =~ /^(DELETE|GET|PATCH|POST|PUT)$/x;
    
    return 1;
}

1;
