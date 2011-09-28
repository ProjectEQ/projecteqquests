#Usage: plugin::RandomRange(minvalue, maxvalue);

sub RandomRange {

	my $MinRandom = $_[0];
	my $MaxRandom = $_[1];

	my $RandomResult = int(rand(($MaxRandom + 1) - $MinRandom)) + $MinRandom;
	if ($RandomResult > $MaxRandom)
	{
		return $MaxRandom;
	}
	return $RandomResult;

}

return 1;	#This line is required at the end of every plugin file in order to use it