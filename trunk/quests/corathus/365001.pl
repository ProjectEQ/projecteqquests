sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::setnexthpevent(16);
	}
	elsif($combat_state == 1)
	{
		my $random_select = rand(2);
		if($random_select == 1)
		{
			quest::say("Ooooh, toys for me?");
		}
		else
		{
			quest::say("I'm ready to play!");
		}
	}
}

sub EVENT_SPAWN
{
	quest::setnexthpevent(16);
}

sub EVENT_HP
{
	if($hpevent == 16)
	{
		quest::say("I'm charging my lasers!");
		$npc->CastSpell(4674, $npc->GetID(), 10, 0);
	}
}

sub EVENT_DEATH
{
	quest::say("I don't want to play with you anymore...");
}