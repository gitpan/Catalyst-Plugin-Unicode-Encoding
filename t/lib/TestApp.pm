package TestApp;
use strict;
use warnings;
use base qw/Catalyst/;
use Catalyst qw/Unicode::Encoding/;

__PACKAGE__->config(
  encoding => $ENV{TESTAPP_ENCODING}
) if $ENV{TESTAPP_ENCODING};

__PACKAGE__->config('name' => 'TestApp');

__PACKAGE__->setup;

sub handle_unicode_encoding_exception {
  my ( $self, $param_value, $error_msg ) = @_;
  return $param_value;
}

1;
