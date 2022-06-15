package NetSuite::Util;

use strict;
use warnings;
use URI;
use URI::QueryParam;
use base qw/Exporter/;
 
our @EXPORT_OK = qw/
    hash_to_query_string
    query_string_to_hash
    nonce
    timestamp
    valid_token
/;

sub hash_to_query_string {
    my $hash = shift;
    
    my $uri = URI->new;
    
    for my $key (sort keys %$hash) {
        $uri->query_param($key => $hash->{$key});
    }
    
    return $uri->query;
}

sub query_string_to_hash {
    my $query_string = shift;
    
    my $uri = URI->new($query_string);
    
    my $hash;
    
    for my $key ($uri->query_param) {
        $hash->{$key} = $uri->query_param($key);
    }
    
    return $hash;
}

sub nonce {
    my $range = ['0'..'9', 'a'..'z', 'A'..'Z'];

    return join '', map { $range->[rand @$range] } 1..20;    
}

sub timestamp {
    return time;
}

sub valid_token {
    my $token = shift;
    
    return $token && $token =~ /^[0-9a-z]{64}$/x;
}

1;
