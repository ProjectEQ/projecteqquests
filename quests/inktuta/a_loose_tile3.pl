sub EVENT_SPAWN {
   quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}
sub EVENT_ENTER {
   quest::ze(15,"The stone tile beneath your feet shifts, setting a complex trap into motion. Amidst the muffled sounds of grinding gears and grating stone you notice the clay golems nearby are stirring. A chill runs down your spine as you realize what you've done. They stumble forth to attack, dried flakes of clay raining from their ancient bodies.");
   quest::depopall(296050);
   quest::spawn2(296048,0,0,-533,-737,-122,64);
   quest::spawn2(296048,0,0,-533,-798,-122,64);
   quest::spawn2(296048,0,0,-454,-798,-122,192);
   quest::spawn2(296048,0,0,-454,-737,-122,192);
   $npc->Damage($npc,1000,732,24,0);
}