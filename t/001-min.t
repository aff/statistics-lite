use v6;

use Test;
plan 6;

use lib 'lib';
use Statistics::Lite;

is(Statistics::Lite::min(<1 2 3>), 1, q{1 2 3 -> 1});
is(Statistics::Lite::min(<3 2 1>), 1, q{3 2 1 -> 1});
is(Statistics::Lite::min(<3 2 -1>), -1, q{3 2 -1 -> -1});
is(Statistics::Lite::min(<2e4 2e5 2e6>), 2e4, q{is: 2e4 2e5 2e6 -> 2e4});
cmp_ok(Statistics::Lite::min(<2e4 2e5 2e6>), 2e4, q{cmp_ok: 2e4 2e5 2e6 -> 2e4});

is(Statistics::Lite::min(), undef, q{undef -> undef});

