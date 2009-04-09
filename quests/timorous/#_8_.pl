# Zone to Overthere event
# Zone: timorous
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 65, $x + 65, $y - 65, $y + 65);
}

sub EVENT_ENTER
{
	quest::movepc(93,2736.0,3438.8,-158.6);
}
