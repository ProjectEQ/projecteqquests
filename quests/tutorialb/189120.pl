# Emotes
# Zone: Tutorialb

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	quest::delglobal("bmote");
	quest::setglobal("bmote",3,3,"F");
	$bmote=undef;
}

sub EVENT_ENTER
{
	quest::emote("Screams echo through the mines around you.");
	quest::depop();
	quest::delglobal("bmote");
	quest::setglobal("bmote",2,3,"F");
	$bmote=undef;
}