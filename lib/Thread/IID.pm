use strict;
use warnings;

package Thread::IID;

 use 5.008001;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Thread::IID ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
  interpreter_id
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = ();

our $VERSION;

require XSLoader;
XSLoader::load('Thread::IID', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

Thread::IID - unique perl Interpreter IDs

=head1 SYNOPSIS

  use Thread::IID ':all';

  print "Hi, I am interpreter #" . interpreter_id();

=head1 DESCRIPTION

This provides an identifier to distinguish Perl interpreter instances.

In environments like L<mod_perl2|mod_perl2>, where interpreters are
cloned and passed around between OS threads, the thread ID gives no
indication of which interpreter instance is actually running
(and hence which corresponding set of values/data-structures
is actually being referenced); for such situations
the interpreter ID is more likely to be what you actually want.

=head2 EXPORT

None by default.  The following function is available:

=head3 interpreter_id()

Returns the current perl interpreter instance's (integer) ID

Where multiple interpreters have been created to run in
threads of the current process the IDs returned will be
distinct for each interpreter, regardless of which
threads are running which interpreters.

It is possible (and likely in the case a C<fork()> has occurred) that
this will return the same ID for interpreters in different processes.

=head2 EXAMPLE

In the following

 my @value = (0, interpreter_id(), $$, time());
 sleep(1);

 sub counter {
     ++$value[0];
     return @value;
 }

C<counter()> is guaranteed to return a list value distinct from all
other invocations in all processes/threads that are running this code
on a given host.

=head1 AUTHOR

Original XS code is from a posting by ikegami at PerlMonks.
Packaged by Roger Crew, E<lt>crew@cs.stanford.eduE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Roger Crew.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=cut
