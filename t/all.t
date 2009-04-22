use v6;

# All tests in one file since rakudo takes ages to start up.

use Test;
plan 49;

use lib 'lib';
use Statistics::Lite;

# min 
is(Statistics::Lite::min(<1 2 3>), 1, q{min 1 2 3 -> 1});
is(Statistics::Lite::min(<3 2 1>), 1, q{min 3 2 1 -> 1});
is(Statistics::Lite::min(<3 2 -1>), -1, q{min 2 -1 -> -1});
ok(Statistics::Lite::min(2e4, 2e5, 2e6) == 2e4, q{ok: min 2e4 2e5 2e6 == 2e4});
is(Statistics::Lite::min(), undef, q{min undef -> undef});

# max
is(Statistics::Lite::max(<1 2 3>), 3, q{max 1 2 3 -> 3});
is(Statistics::Lite::max(<3 2 1>), 3, q{max 3 2 1 -> 3});
is(Statistics::Lite::max(<3 2 -1>), 3, q{max 3 2 -1 -> 3});
ok(Statistics::Lite::max(2e4,2e5,2e6) == 2e6, q{max ok: 2e4 2e5 2e6 -> 2e6});
is(Statistics::Lite::max(), undef, q{max undef -> undef});

# sum
is(Statistics::Lite::sum(<1 2 3>), 6, q{sum 1 2 3 -> 6});
is(Statistics::Lite::sum(<3 2 1>), 6, q{sum 3 2 1 -> 6});
is(Statistics::Lite::sum(<3 2 -1>), 4, q{sum 3 2 -1 -> 4});
is(Statistics::Lite::sum(), undef, q{sum undef -> undef});

# mean
is(Statistics::Lite::mean(<1 2 3>), 2, q{mean 1 2 3 -> 2});
is(Statistics::Lite::mean(<3 2 1>), 2, q{mean 3 2 1 -> 2});
is_approx(Statistics::Lite::mean(<3 2 -1>), 1.33333333333333, q{mean is_approx 3 2 -1 -> 1.333333333333333});
is(Statistics::Lite::mean(), undef, q{mean undef -> undef});

# median
is(Statistics::Lite::median(<1 2 3>), 2, q{median 1 2 3 -> 2});
is(Statistics::Lite::median(<3 2 1>), 2, q{median 3 2 1 -> 2});
is(Statistics::Lite::median(<4 3 2 1>), 2.5, q{median 4 3 2 1 -> 2.5});
is(Statistics::Lite::median(<5 4 3 2 1>), 3, q{median 5 4 3 2 1 -> 3});
is(Statistics::Lite::median(1, 5, 2, 10, 8, 7), 6, q{median 1, 5, 2, 10, 8, 7 -> 6});
is(Statistics::Lite::median(), undef, q{median undef -> undef});

# mode
is(Statistics::Lite::mode(5), 5, q{mode 5});
is(Statistics::Lite::mode(<1 2 3>), 2, q{mode 1 2 3 -> 2});
is(Statistics::Lite::mode(<3 2 1>), 2, q{mode 3 2 1 -> 2});
is(Statistics::Lite::mode(<3 3 2 1>), 3, q{mode });
is(Statistics::Lite::mode(<3 3 2 2 1>), 2.5, q{mode });
is(Statistics::Lite::mode(<5 4 3 2 1>), 3, q{mode 5 4 3 2 1 -> 3});
is(Statistics::Lite::mode(<5 4 4 3 2 1>), 4, q{mode 5 4 3 2 1 -> 3});
is(Statistics::Lite::mode(<1, 3, 6, 6, 6, 6, 7, 7, 12, 12, 17>), 6, q{mode 6});
is(Statistics::Lite::mode(), undef, q{mode undef -> undef});

# variance
is_approx(Statistics::Lite::variance(<3 2 -1>), 4.33333333333333, q{variance is_approx 3 2 -1 -> 4.333333333333333});
is(Statistics::Lite::variance(<1>), 0, q{variance 1 -> 0});
is(Statistics::Lite::variance(<123 456 789>), 110889, q{variance <123 456 789> -> 110889});

is(Statistics::Lite::variance(undef), 0, q{variance (undef) -> undef});
is(Statistics::Lite::variance(), undef, q{variance undef -> undef});


# variancep
is_approx(Statistics::Lite::variancep(<3 2 -1>), 2.88888888888888, q{variance is_approx 3 2 -1 -> 4.888888888888888});
is(Statistics::Lite::variancep(<1>), 0, q{variancep 1 -> 0});
is(Statistics::Lite::variancep(<123 456 789>), 73926, q{variance <123 456 789> -> 73926});
is(Statistics::Lite::variancep(undef), 0, q{variancep (undef) -> undef});
is(Statistics::Lite::variancep(), undef, q{variancep undef -> undef});

# stddev
is_approx(Statistics::Lite::stddev(<3 2 -1>), 2.08166599946613, q{variance is_approx 3 2 -1 -> 2.08166599946613});
is(Statistics::Lite::stddev(<1>), 0, q{stddev 1 -> 0});
is(Statistics::Lite::stddev(<123 456 789>), 333, q{variance <123 456 789> -> 333});


# stddevp
is_approx(Statistics::Lite::stddevp(<3 2 -1>), 1.69967317119759, q{variance is_approx 3 2 -1 -> 1.69967317119759});
is(Statistics::Lite::stddevp(<1>), 0, q{stddevp 1 -> 0});
is(Statistics::Lite::stddevp(<123 456 789>), 271.893361448933, q{variance <123 456 789> -> 271.893361448933});

# statshash
my %h = Statistics::Lite::statshash(1,2,3);
#say %h.perl;
