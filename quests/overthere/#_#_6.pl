# Zone to Timorous event
# Zone: Overthere
# AngeloX
sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
}

sub EVENT_ENTER
{
	quest::movepc(96,3506.0,5702.5,4.6);
}