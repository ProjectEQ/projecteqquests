# Ireblind_Imp.pl

sub EVENT_SPAWN
{
	quest::setnexthpevent(76);
}

sub EVENT_HP
{
	my $x_loc = $npc->GetX();
	my $y_loc = $npc->GetY();
	my $z_loc = $npc->GetZ();
	
	if($hpevent == 76)
	{
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
		quest::setnexthpevent("51");
	}
	
	if($hpevent == 51)
	{
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
		quest::setnexthpevent("26");
	}
	
	if($hpevent == 26)
	{
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
		quest::spawn2(72068, 0, 0, $x_loc, $y_loc, $z_loc, 0);
	}
}