use strict;
use warnings;
use Test::More;
use FindBin qw/ $Bin /;
use lib "$Bin/lib";
use TestLogger;
use Data::Dumper;

BEGIN {
    $ENV{TESTAPP_ENCODING} = 'UTF-8';
    $ENV{TESTAPP_DEBUG} = 0;
    $ENV{CATALYST_DEBUG} = 0;
}

use Catalyst::Test 'TestApp';
TestApp->log(TestLogger->new);

ok request('/capture_charset/utf-8');
is scalar(@TestLogger::LOGS), 0;

ok request('/capture_charset/latin1');
is scalar(@TestLogger::LOGS), 1
    or diag Dumper(\@TestLogger::LOGS);

@TestLogger::LOGS = ();

ok request('/capture_charset/iso-8859-1; header=present');
is scalar(@TestLogger::LOGS), 1
    or diag Dumper(\@TestLogger::LOGS);
like $TestLogger::LOGS[0], qr/content type is 'iso-8859-1'/;

done_testing;
