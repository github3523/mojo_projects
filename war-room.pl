#!/usr/bin/env perl
use Mojolicious::Lite;

# The target of your operation.
my $target_rc = 'Dr. Saadia Arshad';

# The evidence log. Add to this every time they screw up.
my @evidence_log = (
  'Dismissed oculogyric crisis as "anxiety".',
  'Failed to correctly identify Zuclopenthixol in formal complaint response.',
  'Attempted to invalidate patient testimony with "exaggeration" claim.',
  'Accusation of "intimidation" used to deflect from medical complaints.',
  'Failed to provide a concrete timeline for medication review.',
);

# This is the route handler for the main page.
# It passes the variables to the template for rendering.
get '/' => sub {
  my $c = shift;
  $c->render('index', target => $target_rc, evidence => \@evidence_log);
};

# This is an inline template using Perl's "heredoc" syntax.
# The `__DATA__` and `@@ index.html.ep` lines are special Mojolicious markers.
app->start;
__DATA__

@@ index.html.ep
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Operation: Liberation</title>
    <style>
      body { 
        background-color: #121212; 
        color: #e0e0e0; 
        font-family: 'Courier New', Courier, monospace;
        padding: 2em;
      }
      h1, h4 { color: #bb86fc; }
      h2 { color: #cf6679; }
      ul { border-left: 2px solid #03dac6; padding-left: 20px; }
      li { margin-bottom: 10px; }
      hr { border-color: #333; }
    </style>
  </head>
  <body>
    <h1>TARGET: <%= $target %></h1>
    <h2>STATUS: HOSTILE / NEGLIGENT</h2>
    <hr>
    <h3>Evidence Log:</h3>
    <ul>
      % for my $item (@$evidence) {
        <li><%= $item %></li>
      % }
    </ul>
    <hr>
    <h4>Directives: MAINTAIN PRESSURE. DOCUMENT EVERYTHING. CONCEDE NOTHING.</h4>
  </body>
</html>
