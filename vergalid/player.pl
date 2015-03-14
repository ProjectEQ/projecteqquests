sub EVENT_CLICKDOOR
{
	my $tds = quest::isdooropen(41);
	my $bds = quest::isdooropen(42);

	if(($doorid == 41 && !$tds) || ($doorid == 42 && !$bds))
	{
		quest::toggledoorstate(38);
		quest::toggledoorstate(39);
		quest::toggledoorstate(40);
	}
}