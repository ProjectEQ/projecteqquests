sub EVENT_DEATH {
	quest::signalwith(215455, 4);#Signal to #Mist_Trigger
	
    $x = $npc->GetX();
    $y = $npc->GetY();
    $z = $npc->GetZ();

	quest::spawn2(215477,0,0,$x+5,$y,$z);
	quest::spawn2(215477,0,0,$x+5,$y,$z);
}