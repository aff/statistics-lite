package Statistics::Lite;

use v6;

sub min (*@numbers)
{ 
  return unless @numbers;
  my $min = shift @numbers;
  for @numbers { $min = $_ if $_ < $min; }
  return $min;
}

sub max (*@numbers)
{
  return unless @numbers;
  my $max = shift @numbers;
  for @numbers { $max = $_ if $_ > $max; }
  return $max;
}


sub range (*@numbers)
{
 	return unless @_;
 	return max(@numbers) - min (@numbers);
}

sub sum (*@numbers)
{
 	return unless @numbers;
    return [+] @numbers;
}

sub mean (*@numbers)
{
	return unless @numbers;
	return sum(@numbers) / @numbers.elems;
}

sub median (*@numbers)
{
	return unless @numbers;
	my @sorted = @numbers.sort;
    my $mid = (@sorted.elems - 1) / 2;
	return @sorted[$mid] if @sorted.elems % 2;    # odd
    $mid = (@sorted.elems) / 2;
	return (@sorted[$mid-1] + @sorted[$mid]) / 2; # even
}

sub mode (*@numbers)
 {
	return unless @numbers;
	return @numbers[0] if @numbers.elems == 1;
	my %count = ();
	for @numbers { %count{$_}++; }
	my $maxhits = max(%count.values);
	for keys %count { %count.delete($_) if %count{$_} != $maxhits; }
	return mean(keys %count);
}

sub variance (*@numbers)
{
	return unless @numbers;
	return 0 if @numbers.elems == 1;
    my $sqr_sum = [+] @numbers.map: { $_ * $_ };
	return ($sqr_sum - sum(@numbers) * mean(@numbers)) / (@numbers.elems - 1);
}

sub variancep (*@numbers)
{
	return unless @numbers;
	return 0 if @numbers.elems == 1;
    my $sqr_sum = [+] @numbers.map: { $_ * $_ };
	return ($sqr_sum - sum(@numbers) * mean(@numbers)) / @numbers.elems;
}

sub stddev (*@numbers)
{
	return unless @numbers;
	return 0 if @numbers.elems == 1;
	return sqrt variance @numbers;
}

sub stddevp (*@numbers)
{
	return unless @numbers;
	return 0 if @numbers.elems == 1;
	return sqrt variancep @numbers;
}

# sub statshash
# {
# 	return unless @numbers;
# 	return
# 	(
# 		count     => 1,
# 		min       => $_[0],
# 		max       => $_[0],
# 		range     => 0,
# 		sum       => $_[0],
# 		mean      => $_[0],
# 		median    => $_[0],
# 		mode      => $_[0],
# 		variance  => 0,
# 		stddev    => 0,
# 		variancep => 0,
# 		stddevp   => 0
# 	) unless @numbers > 1;
# 	my $count= scalar(@numbers);
# 	@numbers= sort{$a<=>$b}@numbers;
# 	my $median;
# 	if(@numbers&1) { $median= $_[$#_/2]; }
# 	else { my $mid= @numbers/2; $median= ($_[$mid-1]+$_[$mid])/2; }
# 	my $sum= 0;
# 	my %count;
# 	foreach(@numbers) { $sum+= $_; $count{$_}++; }
# 	my $mean= $sum/$count;
# 	my $maxhits= max(values %count);
# 	foreach(keys %count) 
# 	{ delete $count{$_} unless $count{$_} == $maxhits; }
# 	return
# 	(
# 		count     => $count,
# 		min       => $_[0],
# 		max       => $_[-1],
# 		range     => ($_[-1] - $_[0]),
# 		sum       => $sum,
# 		mean      => $mean,
# 		median    => $median,
# 		mode      => mean(keys %count),
# 		variance  => variance(@numbers),
# 		stddev    => stddev(@numbers),
# 		variancep => variancep(@numbers),
# 		stddevp   => stddevp(@numbers)
# 	);
# }

# sub statsinfo
# {
# 	my %stats= statshash(@numbers);
# 	return <<".";
# min       = $stats{min}
# max       = $stats{max}
# range     = $stats{range}
# sum       = $stats{sum}
# count     = $stats{count}
# mean      = $stats{mean}
# median    = $stats{median}
# mode      = $stats{mode}
# variance  = $stats{variance}
# stddev    = $stats{stddev}
# variancep = $stats{variancep}
# stddevp   = $stats{stddevp}
# .
# }

# sub frequencies
# {
# 	return unless @numbers;
# 	return ( $_[0], 1 ) unless @numbers > 1;
# 	my %count;
# 	foreach(@numbers) { $count{$_}++; }
# 	return %count;
# }


# is(min(1,2,3),    1, "call min - functional interface");
# is(max(1,2,3),    3, "call max - functional interface");
# is(range(1,2,3),  2, "call range - functional interface");
# is(sum(1,2,3),    6, "call sum - functional interface");
# is(count(1,2,3),  3, "call count - functional interface");
# is(mean(1,2,3),   2, "call mean - functional interface");
# is(median(1,2,3), 2, "call median - functional interface");
# is(mode(1,2,3),   2, "call mode - functional interface");

# is(variance(1,2,3), 1, "call variance - functional interface");
# is(stddev(1,2,3),   1, "call stddev - functional interface");

# is(variancep(2,4,2,4), 1, "call variancep - functional interface");
# is(stddevp(2,4,2,4),   1, "call stddevp - functional interface");


# my %stats= statshash(1,2,3);

# is($stats{min},    1, "call min - hash-based interface");
# is($stats{max},    3, "call max - hash-based interface");
# is($stats{range},  2, "call range - hash-based interface");
# is($stats{sum},    6, "call sum - hash-based interface");
# is($stats{count},  3, "call count - hash-based interface");
# is($stats{mean},   2, "call mean - hash-based interface");
# is($stats{median}, 2, "call median - hash-based interface");
# is($stats{mode},   2, "call mode - hash-based interface");

# is($stats{variance}, 1, "call variance - hash-based interface");
# is($stats{stddev},   1, "call stddev - hash-based interface");


# %stats= statshash(2,4,2,4);
# ok($stats{variancep}, "call variancep - hash-based interface");
# ok($stats{stddevp},   "call stddevp - hash-based interface");

# %stats= frequencies(1,2,3,3);
# is($stats{1},1, "frequencies matched correctly");
# is($stats{2},1, "frequencies matched correctly");
# is($stats{3},2, "frequencies matched correctly");
