#fury trap 1

sub EVENT_SPAWN {
  quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-960,-1249,3,64);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-977,-1240,3,64);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-977,-1261,3,64);
  quest::ze(15,"An angry voice shouts, They've found the Temple of Fury! They will regret ever crossing the trusik today. Attack!");
  quest::depop_withtimer();
}