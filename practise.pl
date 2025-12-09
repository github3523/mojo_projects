use strict;
use warnings;

my $text1 = "Error Code 404 occurred.";
my $text2 = "Date: 2025-01-15.";

# Match exactly three digits
if ($text1 =~ /\d{3}/) {
    print "Text 1 contains a 3-digit number (404).\n";
}