#!perl

$|++;
 
use strict;
use warnings;
 
use File::Spec;
 
my $parrot_dir = $ENV{PARROT_DIR}
    or die 'Please set $PARROT_DIR (see README).'."\n";
 
my $rakudo_dir = $ENV{RAKUDO_DIR}
    or die 'Please set $RAKUDO_DIR (see README).'."\n";
 
$ENV{PERL6LIB}
    or die 'Please set $PERL6LIB (see README).'."\n";
 
my $parrot_exec = $^O eq 'MSWin32' ? 'parrot.exe' : 'parrot';
if ( ! -d $parrot_dir ) {
     print STDERR "Not a directory $parrot_dir, exiting...\n";
     exit 1;
} elsif ( ! -x File::Spec->catfile( $parrot_dir, $parrot_exec )) {
    print STDERR "Couldn't find parrot executable in $parrot_dir, "
                 . "have you compiled?\n";
    exit 1;
}
 
if ( ! -d $rakudo_dir ) {
    print STDERR "Not a directory $rakudo_dir, exiting...\n";
    exit 1;
} elsif ( ! -f File::Spec->catfile( $rakudo_dir, 'perl6.pbc' )) {
    print STDERR "Couldn't find perl6.pbc file in $rakudo_dir, "
                 . "have you compiled?\n";
    exit 1;
}
 
my @infiles = map { $_.'.in' } qw< Makefile >;
 
my %replacements = (
    PARROT_DIR  => $parrot_dir,
    PARROT_EXEC => $parrot_exec,
    RAKUDO_DIR  => $rakudo_dir,
);
 
if ( !-e 'lib/Test.pm' ) {
    !system("ln -s $rakudo_dir/Test.pm lib/") or die @!;
    print "Symlinked Test.pm from the Rakudo directory \n";
}
 
for my $infile (@infiles) {
    if ((my $outfile = $infile) =~ s/\.in$//g) {
        open my $IN, '<', $infile or die "Couldn't open $infile, $!, $?";
        open my $OUT, '>', $outfile or die "Couldn't open $outfile, $!, $?";
        while (my $line = <$IN>) {
            while ( $line =~ /<(.*?)>/g ) {
                my $repl = $1;
                if (exists $replacements{$repl}) {
                    $line =~ s/<$repl>/$replacements{$repl}/g;
                }
            }
            print $OUT $line;
        }
        print "Created $outfile \n";
    }
}
 
__END__
