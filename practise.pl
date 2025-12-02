#!/usr/bin/perl

use strict;
use warnings;
# You need to install this module first: cpan install MIME::Base64
use MIME::Base64;

my $target_password = "MySuperSecretPassword123!";
my $encoded_data;

print "--- Original Data ---\n";
print "Target String: $target_password\n";

# --- 1. Encode the password using the encode_base64 function
$encoded_data = encode_base64($target_password);

# --- 2. Remove the trailing newline character added by base64 (for clean use)
# Use the binding operator to modify the $encoded_data in place
# It substitutes the final newline ($) with nothing.
$encoded_data =~ s/\n$//;


print "\n--- Obfuscated Data ---\n";
print "Base64 Output: $encoded_data\n";

# --- 3. Show the reverse, for verification (the true purpose of obfuscation)
my $decoded_data = decode_base64($encoded_data);

print "Decoded Back:  $decoded_data\n";