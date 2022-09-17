package Test::Attribute;

use Moo;
with qw/
    NetSuite::Attribute::Realm
    NetSuite::Attribute::ConsumerKey
    NetSuite::Attribute::ConsumerSecret
    NetSuite::Attribute::TokenKey
    NetSuite::Attribute::TokenSecret
    NetSuite::Attribute::URL
    NetSuite::Attribute::Method
    NetSuite::Attribute::Parameters
    NetSuite::Attribute::PathInfo
/;

1;
