package NetSuite::Util;

use strict;
use warnings;
use URI;
use URI::QueryParam;
use String::CamelCase;
use Cwd 'realpath';
use File::Basename;
use base qw/Exporter/;
 
our @EXPORT_OK = qw/
    camelize
    file_exists
    hash_to_query_string
    load_class
    query_string_to_hash
    nonce
    timestamp
    valid_token
/;

sub camelize {
    my $value = shift;
    
    $value =~ s/^\s+|\s+$//xg;
    $value =~ s/-/_/xg;
    $value =~ s/\s/_/xg;
    
    return String::CamelCase::camelize($value);
}

sub file_exists {
    my $file = shift;
    
    my $real_path = dirname(realpath(__FILE__));
    
    return -e $real_path . '/Transaction/' . $file;
}

sub hash_to_query_string {
    my $hash = shift;
    
    my $uri = URI->new;
    
    for my $key (sort keys %$hash) {
        $uri->query_param($key => $hash->{$key});
    }
    
    return $uri->query;
}

sub load_class {
    my $class = shift;
    
    return if $class->can('new') || eval {require $class; 1};
    
    return;
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
