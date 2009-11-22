sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("Hail, friend, Izzik's my name and [tinkering] is my game.");
	}
}