use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'NetSuite',
    ABSTRACT         => 'A perl interface to the NetSuite SuiteTalk REST Web Services API',
    AUTHOR           => 'Lucas Tiago de Moraes <lucastiagodemoraes@gmail.com>',
    VERSION_FROM     => 'lib/NetSuite.pm',
    LICENSE          => 'perl_5',
    MIN_PERL_VERSION => '5.008001',

    META_MERGE => {
        'meta-spec' => {
          version => 2,
        },

        resources => {
            homepage => 'https://github.com/ltmbr/NetSuite',

            bugtracker => {
                web => 'https://github.com/ltmbr/NetSuite/issues'
            },

            repository => {
                type => 'git',
                url  => 'git@github.com:ltmbr/NetSuite.git',
                web  => 'https://github.com/ltmbr/NetSuite'
            }
        }
    },

    PREREQ_PM => {
        'Moo'          => 0,
        'URI'          => 0,
        'Exporter'     => 0,
        'MIME::Base64' => 0,
        'Digest::SHA'  => 0
    },

    test => {
        TESTS => 't/*.t'
    }
);
