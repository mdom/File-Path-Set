package File::Path::Set;

use warnings;
use strict;
use Path::Tiny qw(rootdir path);
use Moo;

has 'base'      => ( is => 'rw', default => sub { return '/' } );
has 'predicate' => ( is => 'rw', default => sub { return sub { -r $_[0] } } );
has 'filename'  => ( is => 'rw', required => 1 );

sub files {
	my ($self,$path) = @_;
	$path = path($path)->realpath;
	my $base = path($self->base)->realpath;
	my @files;
	while ( $base->subsumes($path) ) {
		$DB::single=1;
		my $file = $path->child($self->filename)->stringify;
		if ( $self->predicate->($file) ) {
			push @files, $file
		}
		$path = $path->parent();
	}
	return reverse @files;
}

=head1 NAME

File::Path::Set - Find files along a path

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.02';

=head1 SYNOPSIS

This module finds all readable files along a defined path, possibly stoping at a base path.

This module mimics the behaviour of how apache searches for .htaccess files.

    use File::Path::Set;

    my $set = File::Path::Set->new(
	base => '/bar/baz',
	filename => 'config.inc'
    );
    $set->file_set('/bar/baz/quux/');
    ## => (qw(/bar/baz/quux/config.inc /bar/baz/config.inc))

=head1 METHODS

=head2 new()

Returns a new File::Path::Set object. Only required parameter is
filename.  Other possible paramters are base, which is the last
path to consider. It defaults to the rootdir ('/' on Unix). There
is also a paramter names predicate that can be set to a sub routine,
which will be called with every filename. The filenames are only
returned if predicate return with a true value. If you do not set
this, sub { -r $_[0] } is applied, so that only readable files will
be returned.

=cut

=head2 files($path)

Returns an array of files along $path. The files are sorted with
the shortest file path at the first position.

=cut

=head1 AUTHOR

Mario Domgoergen, C<< <mario at domgoergen.com> >>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc File::Path::Set


You can also look for information at:

=head1 COPYRIGHT & LICENSE

Copyright 2014 Mario Domgoergen, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of File::Path::Set
