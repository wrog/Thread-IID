package Thread::IID;

use 5.008001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Thread::IID ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
  get_interpreter_id	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = ();

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Thread::IID', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

Thread::IID - Perl extension for obtaining unique interpreter IDs

=head1 SYNOPSIS

  use Thread::IID ':all';

  print "Hi, I am interpreter #" . get_interpreter_id();

=head1 DESCRIPTION

This module provides a single function for identifying Perl interpreter 
instances.

=head2 EXPORT

None by default.  The following function is avaliable:

=head3 get_interpreter_id()

Returns an ID for the current Perl interpreter instance.  

Where multiple interpreters have been created to run in 
threads of the current process the IDs returned will be 
different for each interpreter, regardless of the whether 
the interpreters are being run on distinct threads or not.

=head1 AUTHOR

Original code by ikegami at PerlMonks.
Packaged by Roger Crew, E<lt>crew@cs.stanford.eduE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Roger Crew

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
