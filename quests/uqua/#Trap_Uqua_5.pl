#rage trap 2
sub EVENT_SPAWN {
quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}
sub EVENT_ENTER {
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-691,-1239,3,128);
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-680,-1213,3,131);
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-701,-1212,3,131);
quest::ze(15,"A low-pitched voice rumbles, Here the trespassers come. They've almost reached the threshold of the Chamber of Rage. Ambush them, now!");
$npc->Damage($npc,1000,732,24,0);
}
