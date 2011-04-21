sub EVENT_SPAWN {
quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}
sub EVENT_ENTER {
$npc->CastSpell(5722,$userid);
}
