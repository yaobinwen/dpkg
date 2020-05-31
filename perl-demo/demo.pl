#!/usr/bin/perl

use strict;
use warnings;

my %langs =  (
    Argentina => 'Spanish',
    Brazil => 'Portuguese',
    China => 'Chinese',
    Denmark => 'Danish',
    England => 'English',
    France => 'French',
    Germany => 'German'
);
my $ref_langs = \%langs;

# Look up a hash value.
# You can use the key name, with or without quotation, to access its value.
# NOTE that the following statements are all preceded with `$` to indicate a
# scalar context because that's the type of the hash value, although `langs`
# itself is a hash and was defined with `%`.
print "England: ", $langs{England}, "\n";
print "England: ", $langs{'England'}, "\n";
# You can use a reference and the '->' operator to access its value.
print "England: ", $ref_langs->{England}, "\n";
