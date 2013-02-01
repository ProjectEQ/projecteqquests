# Zone to OOT SirensBane event
# Zone: Freeporte
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40);
}

sub EVENT_ENTER
{
#	quest::selfcast("2279");
	quest::emote ("'s spirit moves you to another land ...");
	quest::movepc(69,-9193.3,386.7,5.2);
}