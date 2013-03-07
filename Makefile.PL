use inc::Module::Install 0.91;
use Module::Install::AuthorRequires;
use Module::Install::AuthorTests;

all_from 'lib/Catalyst/Plugin/Unicode/Encoding.pm';

requires 'Class::Data::Inheritable';
requires 'Encode' => '2.49';
requires 'Catalyst' => '5.90015'; # Will work with earlier, but 5.90014 had a test failing bug..
requires 'LWP' => '5.837'; # LWP had unicode fail in 5.8.26
requires 'URI' => '1.36';
requires 'Try::Tiny';

author_requires 'Catalyst::Plugin::Params::Nested';
author_requires 'Test::WWW::Mechanize::Catalyst' => 0.51;
test_requires 'Test::More' => '0.88';
test_requires 'IO::Scalar';
test_requires 'HTTP::Status';

author_tests 't/author';

resources repository => 'http://dev.catalyst.perl.org/repos/Catalyst/Catalyst-Plugin-Unicode-Encoding/';

if ($Module::Install::AUTHOR) {
    system("pod2text lib/Catalyst/Plugin/Unicode/Encoding.pm > README") and die;
}

WriteAll;

