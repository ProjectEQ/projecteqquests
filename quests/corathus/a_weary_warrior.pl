sub EVENT_SPAWN
{
	quest::settimer("try_sit", 10);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(1);
		quest::stoptimer("try_sit");
	}
}

sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::emote("looks over at $name but does not say a word.");
	}
}