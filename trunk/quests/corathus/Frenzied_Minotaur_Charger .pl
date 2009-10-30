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