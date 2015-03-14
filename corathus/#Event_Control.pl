sub EVENT_SAY
{
	my $is_gm = $client->GetGM();
	if($is_gm)
	{
		if($text=~ /Reset/i)
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
			quest::say("[Reset]");
		}
	}
}