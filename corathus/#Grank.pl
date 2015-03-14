sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("Sentry Bot MXII active and ready for [query].");
	}
	elsif($text=~ /Query/i)
	{
		quest::say("Multiple targets found please specify a specific target or ask for a [list] of eligible targets.");
	}
	elsif($text=~ /list/i)
	{
		quest::say("Would you like to query info on [bomb bots], [armored clockworks] or [the duke].");
	}
	elsif($text=~ /bomb bots/i)
	{
		quest::say("Quick moving robots filled with an explosive agent, be wary around these bots.");
	}
	elsif($text=~ /armored clockworks/i)
	{
		quest::say("Large armored clockworks, primarily used as defense their age causes them to sometimes short out.");
	}
	elsif($text=~ /the duke/i)
	{
		quest::say("The Duke appears to have an energy field around him that is capable of controlling mental and arcane energy.");
	}
}