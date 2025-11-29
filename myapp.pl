#!/usr/bin/env perl
use Mojolicious::Lite -signatures;

use DBI;

# 1. Define the database file location
my $db_file = app->home->rel_file('data/app.db');

# 2. Define a function to connect and get the database handle
sub db_connect {
    my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file", "", "", {
        RaiseError => 1,
        AutoCommit => 1,
    });
    return $dbh;
}

# Add a stash variable to hold the database handle for use in handlers (optional but common)
app->hook(before_dispatch => sub ($c) {
    $c->stash(dbh => db_connect());
});

# Existing routes...
get '/' => sub ($c) {
  # ... you can now access the database handle: my $dbh = $c->stash('dbh');
  $c->render(template => 'index');
};
# ... rest of your code ...

get '/' => sub ($c) {
  $c->render(template => 'index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>mojo Welcome to the Mojolicious (TEST) real-time web framework! by Nathan Tadesse</h1>

<form action="/submit" method="POST">
    <h2 style="font-family: sans-serif; text-align:center;">Enter Your Name</h2>
    
    <label for="name">Name:</label>
    <input type="text" id="name" name="user_name" required>
    
    <input type="submit" value="Submit">
</form>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
