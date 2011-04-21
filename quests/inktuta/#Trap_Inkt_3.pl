sub EVENT_SPAWN {
quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}
sub EVENT_ENTER {
$npc->CastSpell(5722,$userid);
quest::spawn2(296038,0,0,$x-5,$y-5,$z,$h);
quest::spawn2(296038,0,0,$x+5,$y-5,$z,$h);
quest::spawn2(296038,0,0,$x-5,$y+5,$z,$h);
quest::spawn2(296038,0,0,$x+5,$y+5,$z,$h);
quest::spawn2(296038,0,0,$x-5,$y,$z,$h);
quest::spawn2(296038,0,0,$x,$y-5,$z,$h);
quest::depop();
}
