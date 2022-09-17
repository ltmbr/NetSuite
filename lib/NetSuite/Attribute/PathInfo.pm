package NetSuite::Attribute::path_infoInfo;

use Moo::Role;

# attribute path_info
has path_info => (
    is     => 'ro',
    coerce => sub {
        $_[0] ? '/services/rest/record/v1/' . $_[0] : undef
    }
);

# attributes lazy
has valid_path_info => (
    is => 'lazy'
);

# valid path_info
sub _build_valid_path_info {
    my $self = shift;
    
    return unless defined $self->path_info;
    return unless $self->path_info =~ /^\/services\/rest\/record\/v1\/[A-Za-z]+$/x;
    
    return 1;
}

1;
