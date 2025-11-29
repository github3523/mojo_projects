use strict;
use warnings;
use 5.010; # Enables 'say'

my $input_file = 'note_practise.txt';

# Open the input file (die with an error message if it fails)
open my $fh, '<', $input_file or die "Can't open '$input_file': $!";

# We'll search for a line containing both Name: ... and ID: ...
my $found = 0;
while (my $line = <$fh>) {
    chomp $line;

    # More flexible pattern: capture name (anything up to a word boundary or comma)
    # and capture the ID token (non-space sequence). Case-insensitive for "Name".
    if ($line =~ /Name:\s*([^,;\n]+?)\b.*?ID:\s*(\S+)/i) {
        my ($name, $id) = ($1, $2);
        $name =~ s/^\s+|\s+$//g;
        $id   =~ s/^\s+|\s+$//g;

        # Normalize name for comparison
        my $lc_name = lc $name;

        if ($lc_name eq 'nathan' && $id eq '1') {
            say "login successful";
        }
        else {
            say "invalid credentials";
        }

        $found = 1;
        last;    # stop after the first match
    }
}

# If no matching Name/ID pair was found at all, consider credentials invalid
unless ($found) {
    say "invalid credentials";
}

close $fh;