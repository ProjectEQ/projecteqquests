#Sporilok the Fungus Commander
sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::emote("Debug: Leaving combat!");
	}
	elsif($combat_state == 1)
	{
		quest::emote("Debug: Entering combat!");
	}
}