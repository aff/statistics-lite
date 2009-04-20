use v6;

use Test;
plan 4;

use lib 'lib';
use Statistics::Lite;

is(Statistics::Lite::sum(<1 2 3>), 6, q{1 2 3 -> 6});
is(Statistics::Lite::sum(<3 2 1>), 6, q{3 2 1 -> 6});
is(Statistics::Lite::sum(<3 2 -1>), 4, q{3 2 -1 -> 4});
#is(Statistics::Lite::sum(<2e4 2e5 2e6>), 2e6, q{is: 2e4 2e5 2e6 -> 2e6});
#cmp_ok(Statistics::Lite::sum(<2e4 2e5 2e6>), 2e6, q{cmp_ok: 2e4 2e5 2e6 -> 2e6});

is(Statistics::Lite::sum(), undef, q{undef -> undef});

