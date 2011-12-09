sub EVENT_SPAWN {
  quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-277,-954,-24,255);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-277,-974,-32,255);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-289,-975,-32,255);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-268,-974,-32,255);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),2,0,-278,-1001,-46,255);
  quest::ze(15,"An angry voice shouts, After the infidels! Crush the trespassing fools and return their severed heads to me.");
  $npc->Depop(1);
}