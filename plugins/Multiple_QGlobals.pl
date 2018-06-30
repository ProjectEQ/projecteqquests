#::: Author: Akkadius
#::: This serves as a system to store qglobals with multiple values stored in one record so the database is much more efficiently utilized
#::: Usage plugin::setmglobal(Name, Value, Options, Duration, Index#);
#::: Indexes logically start at 1
#::: For explanation of use, see: http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginsetmglobalname-value-options-duration-index
sub setmglobal{
	my $qglobals = plugin::var('qglobals');
	my $NV = "";
	if($qglobals->{$_[0]}){
		@QG = split(',', $qglobals->{$_[0]}); $n = 1;
		foreach $val (@QG){
			if($n == $_[4]){ $NV .= "$_[1],";} else{ $NV .= "$val,"; } $n++;
		}
		while($n <= $_[4]){ if($n == $_[4]){ $NV .= "$_[1],";} else{ $NV .= "0,"; } $n++; }
	}else{
		for($i=1;$i<=$_[4];$i++){ if($i == $_[4]){ $NV .= "$_[1],";} else{ $NV .= "0,"; } }
	}
	quest::setglobal($_[0], substr ($NV, 0, -1), $_[2], $_[3]);
}
#::: Usage: plugin::readmglobal(Name, Index);
#::: Use example: 
sub readmglobal{
	my $qglobals = plugin::var('qglobals');
	if($qglobals->{$_[0]}){
		@QG = split(',', $qglobals->{$_[0]});
		return $QG[($_[1] - 1)];
	}
	return;
}