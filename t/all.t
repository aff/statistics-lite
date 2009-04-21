use v6;

use Test;
plan 5;

use lib 'lib';
use Statistics::Lite;

is(Statistics::Lite::min(<1 2 3>), 1, q{min 1 2 3 -> 1});
is(Statistics::Lite::min(<3 2 1>), 1, q{min 3 2 1 -> 1});
is(Statistics::Lite::min(<3 2 -1>), -1, q3{min 2 -1 -> -1});
ok(Statistics::Lite::min(2e4, 2e5, 2e6) == 2e4, q{ok: min 2e4 2e5 2e6 == 2e4});
is(Statistics::Lite::min(), undef, q{min undef -> undef});

is(Statistics::Lite::max(<1 2 3>), 3, q{max 1 2 3 -> 3});
is(Statistics::Lite::max(<3 2 1>), 3, q{max 3 2 1 -> 3});
is(Statistics::Lite::max(<3 2 -1>), 3, q{max 3 2 -1 -> 3});
ok(Statistics::Lite::max(2e4,2e5,2e6) == 2e6, q{max ok: 2e4 2e5 2e6 -> 2e6});
is(Statistics::Lite::max(), undef, q{max undef -> undef});

is(Statistics::Lite::sum(<1 2 3>), 6, q{sum 1 2 3 -> 6});
is(Statistics::Lite::sum(<3 2 1>), 6, q{sum 3 2 1 -> 6});
is(Statistics::Lite::sum(<3 2 -1>), 4, q{sum 3 2 -1 -> 4});
is(Statistics::Lite::sum(), undef, q{sum undef -> undef});

is(Statistics::Lite::mean(<1 2 3>), 2, q{mean 1 2 3 -> 2});
is(Statistics::Lite::mean(<3 2 1>), 2, q{mean 3 2 1 -> 2});
is_approx(Statistics::Lite::mean(<3 2 -1>), 1.33333333333333, q{mean is_approx 3 2 -1 -> 1.333333333333333});
is(Statistics::Lite::mean(), undef, q{mean undef -> undef});

