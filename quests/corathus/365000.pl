sub EVENT_SPAWN
{
	quest::setnexthpevent(30);
}

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::setnexthpevent(30);
		quest::modifynpcstat("hp_regen", "70000");
	}
	else
	{
		quest::modifynpcstat("hp_regen", "0");
	}
}

sub EVENT_HP
{
	if($hpevent == 30)
	{
		quest::settimer("explode_timer", 6);
		quest::emote("gains an electric charge...");
		$npc->Stun(6500);
	}
}

sub EVENT_TIMER
{
	if($timer eq "explode_timer")
	{
		quest::stoptimer("explode_timer");
		quest::emote("explodes.");
		$npc->CastSpell(1948, $npc->GetID(), 10, 0);
		$npc->Kill();
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("explode_timer");
}