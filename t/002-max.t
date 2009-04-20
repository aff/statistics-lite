use v6;

use Test;
plan 6;

use lib 'lib';
use Statistics::Lite;

is(Statistics::Lite::max(<1 2 3>), 3, q{1 2 3 -> 3});
is(Statistics::Lite::max(<3 2 1>), 4, q{3 2 1 -> 3});
is(Statistics::Lite::max(<3 2 -1>), 3, q{3 2 -1 -> 3});
is(Statistics::Lite::max(<2e4 2e5 2e6>), 2e6, q{is: 2e4 2e5 2e6 -> 2e6});
cmp_ok(Statistics::Lite::max(<2e4 2e5 2e6>), 2e6, q{cmp_ok: 2e4 2e5 2e6 -> 2e6});

is(Statistics::Lite::max(), undef, q{undef -> undef});

