
package B::Deobfuscate::Dict::RefactorCode;

use warnings;
use strict;

use vars qw($theme);

use Acme::MetaSyntactic;

our VERSION = '0.04';

=head1 NAME

B::Deobfuscate::Dict::RefactorCode - B:: helper for A::MS::RefactorCode

=head1 SYNOPSIS

   $B::Deobfuscate::Dict::RefactorCode::theme = 'loremipsum';
   require B::Deobfuscate::Dict::RefactorCode;

=cut

# fill the global variable $B::Deobfuscate::Dict::MetaSyntactic
sub _init {
    shift; # never mind
    my $theme = shift;
    my $meta = Acme::MetaSyntactic->new( $theme );

    # NOTE. $meta->name($theme, 0) returns all the names of the theme
    no strict 'refs';
    ${ +__PACKAGE__ } = join "\n",
            # some themes may have duplicates
            #    v
            keys %{ {map { ( $_ => 1 ) } $meta->name( 0 ) } };
    print __PACKAGE__, ": init\n";
}


__PACKAGE__->_init($theme || 'loremipsum'); 

1; # End of B::Deobfuscate::Dict::RefactorCode;
