sub EVENT_SPAWN
{
	quest::setnexthpevent(31);
}

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::setnexthpevent(31);
	}
}

sub EVENT_HP
{
	if($hpevent == 31)
	{
		quest::settimer("explode_timer", 6);
		quest::emote("begins to overload...");
		$npc->Stun(6500);
	}
}

sub EVENT_TIMER
{
	if($timer eq "explode_timer")
	{
		quest::stoptimer("explode_timer");
		quest::emote("explodes, eradicating everything around it.");
		$npc->CastSpell(1948, $npc->GetID(), 10, 0);
		$npc->Kill();
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("explode_timer");
}