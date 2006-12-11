use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Acme::MetaSyntactic::RefactorCode',
    license             => 'perl',
    dist_author         => 'Jerome Fenal <jfenal@free.fr>',
    dist_version_from   => 'lib/Acme/MetaSyntactic/RefactorCode.pm',
    requires => {
        'Test::More' => 0,
        'Acme::MetaSyntactic' => 0,
        'B::Deobfuscate' => 0.14,
        'B::Keywords' => 0,
    },
    add_to_cleanup      => [ 'Acme-MetaSyntactic-RefactorCode-*', '*~', '*/*~', '*/*/*/*~' ],
    gzip => 'gzip -9f',
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
