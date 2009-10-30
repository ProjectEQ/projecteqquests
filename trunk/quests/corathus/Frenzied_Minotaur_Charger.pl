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
		quest::say("Start Combat");
		quest::settimer("charge", 20);
	}
}

sub EVENT_TIMER
{
	if($timer eq "charge")
	{
		quest::say("Charge Timer");
		my $cur_target = $npc->GetTarget();
		if($cur_target)
		{
			quest::say("Have Target");
			my $dist = plugin::Dist($npc, $cur_target);
			if($dist > 20)
			{
				quest::say("Outside range");
				my $target_name = $cur_target->GetCleanName();
				quest::emote("breaks his bonds and charges $target_name.");
				quest::settimer("charge_end", 3);
				$npc->BuffFadeByEffect(3); #snare
				$npc->BuffFadeByEffect(99); #root
				quest::modifynpcstat("max_hit", 1980);
				quest::modifynpcstat("min_hit", 840);
				quest::modifynpcstat("runspeed", 3.75);
			}
			else
			{
				quest::say("Inside Range");
			}
		}
	}
	elsif($timer eq "charge_end")
	{
		quest::say("Charge End");
		quest::modifynpcstat("max_hit", 990);
		quest::modifynpcstat("min_hit", 420);
		quest::modifynpcstat("runspeed", 1.25);
	}
}