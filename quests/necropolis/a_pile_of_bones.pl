sub EVENT_COMBAT {
	$npc->Depop(1);
        quest::spawn2(123097,0,0,$x,$y,$z,$h);
}
