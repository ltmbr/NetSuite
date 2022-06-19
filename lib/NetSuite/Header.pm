package NetSuite::Header;

use Moo;
use NetSuite::Signature;
use NetSuite::Util qw/nonce timestamp/;

with qw/
    NetSuite::Config
    NetSuite::Attribute::Realm
    NetSuite::Attribute::ConsumerKey
    NetSuite::Attribute::ConsumerSecret
    NetSuite::Attribute::TokenKey
    NetSuite::Attribute::TokenSecret
    NetSuite::Attribute::URL
    NetSuite::Attribute::Method
    NetSuite::Attribute::Parameters
/;

sub header {
    my $self = shift;
    
    my $realm = $self->realm;
    $realm    =~ s/\-/_/;   
     
    my $nonce      = nonce;
    my $timestamp  = timestamp;
    
    my $parameters = $self->_parameters($nonce, $timestamp);
    
    my $signature = NetSuite::Signature->new(
        consumer_secret => $self->consumer_secret,
        token_secret    => $self->token_secret,    
        url             => $self->url,
        method          => $self->method,
        parameters      => $parameters       
    )->signature;
    
    my $header = 'OAuth realm="' . uc($realm) . '",';
    $header   .= 'oauth_consumer_key="' . $self->consumer_key . '",';
    $header   .= 'oauth_token="' . $self->token_key . '",';
    $header   .= 'oauth_signature_method="' . $self->signature_method . '",';
    $header   .= 'oauth_timestamp="' . $timestamp . '",';
    $header   .= 'oauth_nonce="' . $nonce . '",';
    $header   .= 'oauth_version="' . $self->version . '",';
    $header   .= 'oauth_signature="' . $signature . '"';
    
    return $header;
}

sub _parameters {
    my ($self, $nonce, $timestamp) = @_;
    
    return {
        oauth_consumer_key     => $self->consumer_key,
        oauth_signature_method => $self->signature_method,
        oauth_token            => $self->token_key,
        oauth_version          => $self->version,
        oauth_nonce            => $nonce,
        oauth_timestamp        => $timestamp,
        %{$self->parameters}
    };
}

1;
