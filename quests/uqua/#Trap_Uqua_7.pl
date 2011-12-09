#fury trap 2

sub EVENT_SPAWN {
  quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-1075,-1224,3,124);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-1083,-1204,3,129);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-1061,-1205,3,129);
  quest::ze(15,"A voice in the distance shouts, What? They continue to advance? Within moments they will find the chamber of fury. Send in a group of our strongest fighters.");
  $npc->Depop(1);
}