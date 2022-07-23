package NetSuite;

use Moo;
use Furl;
use NetSuite::Util qw/
    camelize 
    file_exists
/;

with qw/
    NetSuite::Attribute::Agent
    NetSuite::Attribute::Realm
    NetSuite::Attribute::ConsumerKey
    NetSuite::Attribute::ConsumerSecret
    NetSuite::Attribute::TokenKey
    NetSuite::Attribute::TokenSecret
/;

our $VERSION = '0.01';

# attribute furl
has 'furl' => (
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

sub transaction {
    my ($self, $transaction) = @_;
    
    if ($transaction) {
        $transaction = camelize($transaction);
        my $file = camelize($transaction) . '.pm';
        
        if (file_exists($file)) {
            my $class = "NetSuite::Transaction::$transaction";
            
            if (load_class $class) {
                return $class->new(
                    url  => $self->url,
                    furl => $self->furl
                );
            }
        }
    }
    
    return;
}

1;
