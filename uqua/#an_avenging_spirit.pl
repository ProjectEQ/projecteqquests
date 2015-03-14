sub EVENT_SPAWN {
  quest::settimer(1,30);
}

sub EVENT_TIMER {
  quest::depop();
}

sub EVENT_SLAY {
  quest::spawn2(quest::ChooseRandom(292043,292044,292045,292046,292047,292048,292049,292050),0,0,$x,$y,$z,$h);
}