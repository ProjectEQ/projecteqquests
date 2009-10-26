sub EVENT_SPAWN
{
	quest::settimer("explode_timer", 10);
	quest::emote("begins to overload.");
}

sub EVENT_TIMER
{
	if($timer eq "explode_timer")
	{
		quest::stoptimer("explode_timer");
		quest::emote("overloads, damaging everything around it.");
		
		my @clientlist = $entity_list->GetClientList();
		foreach $ent (@clientlist)
		{
			my $x_dist = 0;
			my $y_dist = 0;
			my $z_dist = 0;
			
			$x_dist = $npc->GetX() - $ent->GetX();
			$x_dist = $x_dist * $x_dist;
			
			$y_dist = $npc->GetY() - $ent->GetY();
			$y_dist = $y_dist * $y_dist;
			
			$z_dist = $npc->GetZ() - $ent->GetZ();
			$z_dist = $z_dist * $z_dist;
			
			my $total_dist = $x_dist + $y_dist + $z_dist;
			if($total_dist <= 10000)
			{
				$ent->Damage($npc, 3000, 2993, 4, false);
			}
		}
		$npc->Kill();
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("explode_timer");
}