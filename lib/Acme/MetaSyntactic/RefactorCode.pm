package Acme::MetaSyntactic::RefactorCode;

use warnings;
use strict;
use base 'B::Deobfuscate';
use Acme::MetaSyntactic;
use Data::Dumper;
use Getopt::Std;

=head1 NAME

Acme::MetaSyntactic::RefactorCode - Theme and refactor your code!

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.02';

=head1 SYNOPSIS

Acme::MetaSyntactic::RefactorCode helps you give signicant variable names to your
code.

The default (I<loremipsum> theme) way to use it is:

   perl -MAcme::MetaSyntactic::RefactorCode script.pl > loremipsumed.pl

Or the themed version:

   perl -MAcme::MetaSyntactic::RefactorCode script.pl -t theme > themed.pl

Take special care to choose a theme that has sufficient entries to refactor your
code. Use this one-liner to get available themes:

   perl -MAcme::MetaSyntactic -e 'print join "\n",Acme::MetaSyntactic->themes'

=head1 ABSTRACT

Make your code special, using the theme of your choice available from the great
C<Acme::MetaSyntactic> by BooK.

=cut


BEGIN { 
    our ( $opt_t );
    getopt('t:');
    $opt_t = "loremipsum" if not Acme::MetaSyntactic->has_theme($opt_t);
    my $meta = Acme::MetaSyntactic->new( $opt_t );
    open *B::Deobfuscate::DATA, "<:scalar", \join( "\n",
        # Circumvent broken API that force to type more than needed, not
        # counting this very comment               +
        #                                          |
        # some themes may have duplicates          |
        #    v                                     v
        keys %{ {map { ( $_ => 1 ) } $meta->name($opt_t => 0) } } )  ;
}

sub import { require O; O->import( 'Deobfuscate', @_ ); }

=head1 AUTHOR

Jerome Fenal, C<< <jfenal@free.fr> >>

=head1 BUGS

AMSRC will explode if using a theme that has no sufficient entries for your
code.

B::Deobfuscate seems also to have problems with big code chunks (tried it on the
future 0.02 L<Solaris::Disk::SVM>), some methods calls not being translated.

Please report any other bugs or feature requests to
C<bug-acme-metasyntactic-refacecode@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Acme-MetaSyntactic-RefactorCode>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 ACKNOWLEDGEMENTS

Heavily (completely) based on the idea and the code of L<Acme::Floral> by Joshua b.
Jore.

This module could not have happened without the L<Acme::MetaSyntactic> module by
Philippe "BooK" Bruhat.

=head1 COPYRIGHT & LICENSE

Copyright 2005 Jérôme Fenal, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Acme::MetaSyntactic::RefactorCode
