#council king
sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 2, 0);
		quest::stoptimer("rage");
		quest::stoptimer("kill");
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 1, 0);
		$npc->SetEntityVariable(1, 0);
		$npc->SetEntityVariable(2, 1);
		quest::shout("Bow down urchins!");
		quest::stoptimer("flavor_text");
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 3, 0);
	quest::shout("The throne... usurped...");
	quest::stoptimer("rage");
	quest::stoptimer("kill");
}

sub EVENT_SIGNAL
{
	if($signal == 1 || $signal == 2 || $signal == 3 || $signal == 4)
	{
		my $num_dead = ($npc->GetEntityVariable(1) + 1);
		$npc->SetEntityVariable(1, $num_dead);
		quest::emote("roars with rage as his comrade falls.");
		quest::stoptimer("rage");
		quest::settimer("rage", 15);
		quest::modifynpcstat("attack_speed", "-50");
	}
}

sub EVENT_TIMER
{
	if($timer eq "rage")
	{
		quest::stoptimer("rage");
		quest::modifynpcstat("attack_speed", "0");
	}
	
	if($timer eq "kill")
	{
		$npc->SetEntityVariable(2, 1);
		quest::stoptimer("kill");
	}

	if($timer eq "flavor_text")
	{
		if(rand(100) <= 10.0)
		{
			#do our flavor here
		}
	}
}

sub EVENT_SLAY
{
	my $can_shout = $npc->GetEntityVariable(2);
	if($can_shout == 1)
	{
		quest::settimer("kill", 3);
		$npc->SetEntityVariable(2, 0);
		quest::shout("That is why I am king!");
	}
}

sub EVENT_SPAWN
{
	quest::settimer("flavor_text", 10);
}