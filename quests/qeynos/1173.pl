# Zone to Erud Crossing 
#NPC: Golden Maiden
# Zone: Qeynos
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
	quest::movepc(98,716.9,-1771.8,3.2);
}
