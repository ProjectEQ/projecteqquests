sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("'ello I am Danika, I hail from the MIGHTY town of Rivervale! I am a fierce fighter by spirit but a trader by reputation, if there's anything you need just let me know.");
	}
}