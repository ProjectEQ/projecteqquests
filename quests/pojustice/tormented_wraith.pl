sub EVENT_DEATH
{
	my $r_n = int(rand(100));
	if($r_n < 75)
	{
		my $npc_id_to_spawn = quest::ChooseRandom(201336, 201440, 201441);
		my $x_loc = $npc->GetX();
		my $y_loc = $npc->GetY();
		my $z_loc = $npc->GetZ();
		my $head = $npc->GetHeading();
		quest::spawn2($npc_id_to_spawn, 0, 0, $x_loc, $y_loc, $z_loc, $head);	
	}
}