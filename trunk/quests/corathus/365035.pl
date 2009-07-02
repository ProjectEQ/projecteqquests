sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::say("combat exit.");
	}
	elsif($combat_state == 1)
	{
		quest::say("combat entered.");
	}
}