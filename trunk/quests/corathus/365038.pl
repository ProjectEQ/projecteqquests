#Sporilok the Fungus Commander

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::say("Debug: Leaving combat!");
	}
	elsif($combat_state == 1)
	{
		quest::say("Debug: Entering combat!");
	}
}

sub EVENT_DEATH
{
	quest::emote("slowly stops moving and comes crashing to the ground.");
}