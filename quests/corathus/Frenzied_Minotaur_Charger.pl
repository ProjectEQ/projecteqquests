sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("charge");
		quest::stoptimer("charge_end");
		quest::modifynpcstat("max_hit", 990);
		quest::modifynpcstat("min_hit", 420);
		quest::modifynpcstat("runspeed", 1.25);
	}
	else
	{
		quest::settimer("charge", 20);
	}
}

sub EVENT_TIMER
{
	if($timer eq "charge")
	{
		my $cur_target = $npc->GetTarget();
		if($cur_target)
		{
			my $dist = plugin::DistNoRoot($npc, $cur_target);
			if($dist > 400)
			{
				my $target_name = $cur_target->GetCleanName();
				quest::emote("breaks his bonds and charges $target_name.");
				quest::settimer("charge_end", 2);
				$npc->BuffFadeByEffect(3); #snare
				$npc->BuffFadeByEffect(99); #root
				quest::modifynpcstat("max_hit", 2580);
				quest::modifynpcstat("min_hit", 995);
				quest::modifynpcstat("runspeed", 2.25);
			}
		}
	}
	elsif($timer eq "charge_end")
	{
		quest::modifynpcstat("max_hit", 990);
		quest::modifynpcstat("min_hit", 420);
		quest::modifynpcstat("runspeed", 1.25);
		quest::stoptimer("charge_end");
	}
}