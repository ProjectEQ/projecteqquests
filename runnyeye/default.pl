
sub EVENT_DEATH_COMPLETE 
	{
 	my $mrace = $npc->GetRace();

	if ($mrace == 28)
		{
		my $daman = $entity_list->GetClientByID($killer_id);
		quest::gmsay("A cloud of spores has erupted at your feet",10, 0);
		my $spore = int(rand(100) + 1);
		if ($spore <= 15) 
			{
			my $num = plugin::RandomRange(2,4);
			
			for (my $i = 1; $i <= $num; $i++)	
				{
				my $xoff = $x + plugin::RandomRange(0,4);
				my $yoff = $y + plugin::RandomRange(0,4);
				quest::spawn2(11166,0,0,$xoff,$yoff,$z+7,0);
				}
			}
		}
	}
