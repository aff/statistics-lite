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
  for @numbers{ $max = $_ if $_ > $max; }
  return $max;
}


# sub range
# {
# 	return unless @_;
# 	return 0 unless @_ > 1;
# 	return abs($_[1]-$_[0]) unless @_ > 2;
# 	my $min= shift; my $max= $min;
# 	foreach(@_) { $min= $_ if $_ < $min; $max= $_ if $_ > $max; }
# 	return $max - $min;
# }

# sub sum
# {
# 	return unless @_;
# 	return $_[0] unless @_ > 1;
# 	my $sum;
# 	foreach(@_) { $sum+= $_; }
# 	return $sum;
# }

# sub mean
# {
# 	return unless @_;
# 	return $_[0] unless @_ > 1;
# 	return sum(@_)/scalar(@_);
# }

# sub median
# {
# 	return unless @_;
# 	return $_[0] unless @_ > 1;
# 	@_= sort{$a<=>$b}@_;
# 	return $_[$#_/2] if @_&1;
# 	my $mid= @_/2;
# 	return ($_[$mid-1]+$_[$mid])/2;
# }

# sub mode
# {
# 	return unless @_;
# 	return $_[0] unless @_ > 1;
# 	my %count;
# 	foreach(@_) { $count{$_}++; }
# 	my $maxhits= max(values %count);
# 	foreach(keys %count) { delete $count{$_} unless $count{$_} == $maxhits; }
# 	return mean(keys %count);
# }

# sub variance
# {
# 	return unless @_;
# 	return 0 unless @_ > 1;
# 	my $mean= mean @_;
# 	return (sum map { ($_ - $mean)**2 } @_) / $#_;
# }

# sub variancep
# {
# 	return unless @_;
# 	return 0 unless @_ > 1;
# 	my $mean= mean @_;
# 	return (sum map { ($_ - $mean)**2 } @_) / ( $#_ +1 );
# }

# sub stddev
# {
# 	return unless @_;
# 	return 0 unless @_ > 1;
# 	return sqrt variance @_;
# }

# sub stddevp
# {
# 	return unless @_;
# 	return 0 unless @_ > 1;
# 	return sqrt variancep @_;
# }

# sub statshash
# {
# 	return unless @_;
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
# 	) unless @_ > 1;
# 	my $count= scalar(@_);
# 	@_= sort{$a<=>$b}@_;
# 	my $median;
# 	if(@_&1) { $median= $_[$#_/2]; }
# 	else { my $mid= @_/2; $median= ($_[$mid-1]+$_[$mid])/2; }
# 	my $sum= 0;
# 	my %count;
# 	foreach(@_) { $sum+= $_; $count{$_}++; }
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
# 		variance  => variance(@_),
# 		stddev    => stddev(@_),
# 		variancep => variancep(@_),
# 		stddevp   => stddevp(@_)
# 	);
# }

# sub statsinfo
# {
# 	my %stats= statshash(@_);
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
# 	return unless @_;
# 	return ( $_[0], 1 ) unless @_ > 1;
# 	my %count;
# 	foreach(@_) { $count{$_}++; }
# 	return %count;
# }
