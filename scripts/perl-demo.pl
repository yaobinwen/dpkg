#!/usr/bin/perl

use strict;
use warnings;

my @call_target = ();
my $admindir;
my $parallel;
my $parallel_force = 0;
my @rootcommand = ();
my @source_opts;

sub usage {
    print "perl-demo usage", "\n";
};

sub showversion {
    print "v1.0.0", "\n";
};

print "\@ARGV size: ", scalar @ARGV, "\n";
print "\@ARGV = ", join(',', @ARGV), "\n";

while (@ARGV) {
    $_ = shift @ARGV;
    print "\$_ = ", $_, "\n";

    if (/^(?:--help|-h|-\?)$/) {
        usage;
        exit 0;
    } elsif (/^--version$/) {
        showversion;
        exit 0;
    } elsif (/^--admindir$/) {
        $admindir = shift @ARGV;
    } elsif (/^--admindir=(.*)$/) {
        $admindir = $1;
    } elsif (/^--source-option=(.*)$/) {
        push @source_opts, $1;
    } elsif (/^(?:-j|--jobs=)(\d*|auto)$/) {
        $parallel = $1 || '';
        $parallel_force = 1;
    } elsif (/^(?:-r|--root-command=)(.*)$/) {
        my $arg = $1;
        @rootcommand = split ' ', $arg;
    }
};

print "----------", "\n";
print "CLI arguments are:", "\n";
print "\$admindir = ", $admindir, "\n";
print "\@source_opts = ", join(',', @source_opts), " (size: ", scalar @source_opts, ")", "\n";
print "\$parallel = ", $parallel, "\n";
print "\$parallel_force = ", $parallel_force, "\n";
print "\@rootcommand = ", join(',', @rootcommand), "\n";