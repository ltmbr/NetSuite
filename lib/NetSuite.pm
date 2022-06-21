package NetSuite;

use Moo;
use Furl;

our $VERSION = '0.01';

with qw/
    NetSuite::Attribute::Agent
    NetSuite::Attribute::Realm
    NetSuite::Attribute::ConsumerKey
    NetSuite::Attribute::ConsumerSecret
    NetSuite::Attribute::TokenKey
    NetSuite::Attribute::TokenSecret
/;

# attribute ua
has 'ua' => (
    is       => 'ro',
    init_arg => undef,
    lazy     => 1,
    default  => sub {
        Furl->new(
            agent   => $_[0]->{agent},
            timeout => 20
        );
    }
);

# attribute url
has 'url' => (
    is       => 'ro',
    writer   => 'set_url',
    init_arg => undef
);

sub BUILD {
    my $self = shift;
    
    if ($self->valid_realm) {            
        my $url = 'https://' . $self->realm . '.suitetalk.api.netsuite.com';
        
        $self->set_url($url);
    }
}

1;
