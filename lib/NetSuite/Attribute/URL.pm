package NetSuite::Attribute::URL;

use Moo::Role;

# attribute url
has url => (
    is => 'ro'
);

# attributes lazy
has valid_url => (
    is => 'lazy'
);

# valid url
sub _build_valid_url {
    my $self = shift;
    
    return unless defined $self->url;
    return unless $self->url =~ /^https:\/\/[0-9a-z-]+\.suitetalk\.api\.netsuite\.com/x;
    
    return 1;
}

1;
