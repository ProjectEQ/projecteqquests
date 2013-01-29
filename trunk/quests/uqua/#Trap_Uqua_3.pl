sub EVENT_SPAWN {
  quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),3,0,-495,-1280,-24,1);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),3,0,-494,-1220,-52,1);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),3,0,-506,-1220,-52,1);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),3,0,-484,-1221,-52,1);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),3,0,-497,-1195,-52,1);
  quest::ze(15,"An angry voice shouts, After the infidels! Crush the trespassing fools and return their severed heads to me.");
  quest::depop_withtimer();
}