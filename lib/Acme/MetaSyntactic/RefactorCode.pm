package Acme::MetaSyntactic::RefactorCode;

use warnings;
use strict;
use B::Deobfuscate;
use Acme::MetaSyntactic;

=head1 NAME

Acme::MetaSyntactic::RefactorCode - The great new Acme::MetaSyntactic::RefactorCode!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Acme::MetaSyntactic::RefactorCode helps you give signicant variable names to your
code.

The easy way to use it is:

   perl -MAcme::MetaSyntactic::RefactorCode yourscript.pl > yournewscript.pl

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=cut

BEGIN { srand time; }
sub _LoadDecoder { open *B::Deobfuscate::DATA, "<:scalar", join "\n", metaname(101) }
sub import { shift; require O; O->import( 'Deobfuscate', @_ ) }

=head1 AUTHOR

Jerome Fenal, C<< <jfenal@free.fr> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-acme-metasyntactic-refacecode@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Acme-MetaSyntactic-RefactorCode>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 ACKNOWLEDGEMENTS

Heavily (completely) based on the idea and the code of Acme::Floral by Joshua b.
Jore.

=head1 COPYRIGHT & LICENSE

Copyright 2005 Jerome Fenal, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Acme::MetaSyntactic::RefactorCode
