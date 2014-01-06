use strict;
use warnings;
package RT::Extension::LocalDateHeader;

our $VERSION = '0.02';

=head1 NAME

RT-Extension-LocalDateHeader - Display local date for attachment Date header

=head1 DESCRIPTION

The Date: header included in emails received by RT will often be in the
sender's timezone (or possibly force to UTC by the remove mail server).
This extension will rewrite the Date: header to the user's timezone
while also displaying the original Date: next to it.

=head1 VERSION

Compatible with RT 4.0 and 4.2.  Versions earlier than 4.0.8 will need to
patch as instructed below.  Untested on 3.8.

=head1 INSTALLATION 

=over

=item perl Makefile.PL

=item make

=item make install

May need root permissions

=item Edit your /opt/rt4/etc/RT_SiteConfig.pm

If you are using RT 4.2 or later, add this line:

    Plugin('RT::Extension::LocalDateHeader');

For earlier releases of RT 4, add this line:

    Set(@Plugins, qw(RT::Extension::LocalDateHeader));

or add C<RT::Extension::LocalDateHeader> to your existing C<@Plugins> line.

=item patch RT

If you are running RT 4.0.7 or earlier:

    patch -d /opt/rt4 -p1 < etc/callback_before_localization.diff

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 AUTHOR

sunnavy <sunnavy@bestpractical.com>

=head1 LICENSE AND COPYRIGHT

Copyright 2012-2014 Best Practical Solutions, LLC.

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut

1;
