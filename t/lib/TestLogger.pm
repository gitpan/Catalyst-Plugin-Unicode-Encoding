package TestLogger;
use strict;
use warnings;

our @LOGS;

sub new {
    return bless {}, __PACKAGE__;
}

sub debug {
    shift;
    push(@LOGS, shift());
}

1;

