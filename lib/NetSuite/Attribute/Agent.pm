package NetSuite::Attribute::Agent;

use Moo::Role;

# attribute agent
has agent => (
    is      => 'ro',
    default => 'Perl-NetSuite'
);

1;
