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

#Usage:   %cash = plugin::RandomCash(mincash, maxcash);
#Returns: quest::givecash($cash{copper}, $cash{silver}, $cash{gold}, $cash{platinum});

sub RandomCash {
  my $mincash = $_[0];
  my $maxcash = $_[1];
  my $copper = 0;
  my $silver = 0;
  my $gold = 0;
  my $platinum = 0;
  my $reward = 0;
  my %cash = ();

  $reward = RandomRange($mincash, $maxcash);

  if ($reward > 999) {
    $platinum = int($reward / 1000);
    $reward = ($reward % 1000);
  }
  if ($reward > 99) {
    $gold = int($reward / 100);
    $reward = ($reward % 100);
  }
  if ($reward > 9) {
    $silver = int($reward / 10);
    $reward = ($reward % 10);
  }
  if ($reward > 0) {
    $copper = $reward;
  }

  %cash = (
    'copper'   => $copper,
    'silver'   => $silver,
    'gold'     => $gold,
    'platinum' => $platinum
  );

  return %cash;
}

return 1;	#This line is required at the end of every plugin file in order to use it