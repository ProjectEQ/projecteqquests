# Zone to nro event
# Zone: iceclad
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
}

sub EVENT_ENTER
{
	quest::movepc(34,-949.81,801,-5.55); # Zone: nro
}