# Zone to tenebrous event
# Zone: firiona
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER
{
	quest::movepc(96,-3260.10,-4544.56,19.47);
}