package NetSuite::Signature;

use Moo;
use URI::Escape;
use MIME::Base64;
use Digest::SHA qw/hmac_sha256/;
use NetSuite::Util qw/hash_to_query_string/;

with qw/
    NetSuite::Attribute::ConsumerSecret
    NetSuite::Attribute::TokenSecret
    NetSuite::Attribute::URL
    NetSuite::Attribute::Method
    NetSuite::Attribute::Parameters
/;

sub signature {
    my $self = shift;
    
    my $data = $self->_data;
    my $key  = $self->_key;
    
    return uri_escape(encode_base64(hmac_sha256($data, $key), ''));
}

sub _data {
    my $self = shift;

    my $query_string = hash_to_query_string($self->parameters);    
    
    my $data = $self->method;
    $data   .= '&' . uri_escape($self->url);
    $data   .= '&' . uri_escape($query_string);
    
    return $data;
}

sub _key {
    my $self = shift;
    
    return $self->consumer_secret . '&' . $self->token_secret;
}

1;
