sub EVENT_SAY
{
	my $is_gm = $client->GetGM();
	if($is_gm)
	{
		if($text=~ /Enable/i)
		{
			if($text=~ /Start/i)
			{
				#enable spawn cond 1
				quest::spawn_condition("corathus", 1, 1);
			}
			elsif($text=~ /Courtyard/i)
			{
				#enable spawn cond 2
				quest::spawn_condition("corathus", 2, 1);
			}
			elsif($text=~ /Minotaur/i)
			{
				quest::spawn_condition("corathus", 4, 1);
				quest::spawn_condition("corathus", 10, 1);
				quest::spawn_condition("corathus", 7, 0);
			}
		}
		elsif($text=~ /Disable/i)
		{
			if($text=~ /Start/i)
			{
				#disable spawn cond 1
				quest::spawn_condition("corathus", 1, 0);
				quest::depopall(365029);
			}
			elsif($text=~ /Courtyard/i)
			{
				#disable spawn cond 2
				quest::spawn_condition("corathus", 2, 0);
			}
			elsif($text=~ /Minotaur/i)
			{
				quest::spawn_condition("corathus", 4, 0);
				quest::spawn_condition("corathus", 10, 0);
				quest::spawn_condition("corathus", 7, 1);
			}
		}
		elsif($text=~ /Reset/i)
		{
			quest::spawn_condition("corathus", 1, 1);
			quest::spawn_condition("corathus", 2, 0);
			quest::spawn_condition("corathus", 3, 1);
			quest::spawn_condition("corathus", 4, 1);
			quest::spawn_condition("corathus", 5, 1);
			quest::spawn_condition("corathus", 6, 0);
			quest::spawn_condition("corathus", 7, 0);
			quest::spawn_condition("corathus", 8, 0);
			quest::spawn_condition("corathus", 9, 0);
			quest::spawn_condition("corathus", 10, 0);
			quest::spawn_condition("corathus", 11, 0);			
		}
		else
		{
			quest::say("Options:");
			quest::say("[Reset], [Enable]/[Disable] + argument");
			quest::say("Start");
			quest::say("Courtyard");
			quest::say("Minotaur");
		}
	}
}