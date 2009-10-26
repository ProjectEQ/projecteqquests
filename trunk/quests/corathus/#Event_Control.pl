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
				#disable spawn cond 2
				quest::spawn_condition("corathus", 1, 1);
				quest::spawn_condition("corathus", 2, 0);
			}
			elsif($text=~ /Courtyard/i)
			{
				#enable spawn cond 2
				#disable spawn cond 1
				quest::spawn_condition("corathus", 2, 1);
				quest::spawn_condition("corathus", 1, 0);
				quest::depopall(365029);
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
		}
		else
		{
			quest::say("Options:");
			quest::say("[Enable]/[Disable] + argument");
			quest::say("Start");
			quest::say("Courtyard");
		}
	}
}