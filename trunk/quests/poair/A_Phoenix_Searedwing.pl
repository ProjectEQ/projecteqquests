sub EVENT_DEATH {
	quest::signalwith(215455, 4);#Signal to #Mist_Trigger
	
	$x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();

	quest::spawn2(215478,0,0,$x-5,$y,$z);
	quest::spawn2(215478,0,0,$x+5,$y,$z);
	quest::spawn2(215478,0,0,$x,$y+5,$z);
	quest::spawn2(215478,0,0,$x,$y-5,$z);
}