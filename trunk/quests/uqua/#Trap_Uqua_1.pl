sub EVENT_SPAWN {
quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}
sub EVENT_ENTER {
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),0,0,-223,-173,-20,0);
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),0,0,-229,-172,-20,0);
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),0,0,-217,-176,-20,0);
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),0,0,-223,-198,-20,0);
quest::depop();
}
