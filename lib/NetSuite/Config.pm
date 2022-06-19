package NetSuite::Config;

use Moo::Role;

# attribute signature method
has 'signature_method' => (
    is       => 'ro',
    init_arg => undef,
    default  => 'HMAC-SHA256'
);

# attribute version
has 'version' => (
    is       => 'ro',
    init_arg => undef,
    default  => '1.0'
);

1;
