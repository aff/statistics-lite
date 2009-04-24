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
    return unless @numbers;
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

sub frequencies (*@numbers)
{
  return unless @numbers;
  return ( @numbers[0], 1 ) unless @numbers.elems > 1;
  my %count;
  for @numbers { %count{$_}++; }
  return %count;
}

sub statshash (*@numbers) {
  my %hash = (
    count     => @numbers.elems,
    min       => min(@numbers),
    max       => max(@numbers),
    range     => range(@numbers),
    sum       => sum(@numbers),
    mean      => mean(@numbers),
    median    => median(@numbers),
    mode      => mode(@numbers),
    variance  => variance(@numbers),
    stddev    => stddev(@numbers),
    variancep => variancep(@numbers),
    stddevp   => stddevp(@numbers),
  );
  return %hash;
}


