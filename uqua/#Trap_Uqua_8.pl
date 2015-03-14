#final trap

sub EVENT_SPAWN {
  quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-878,-1157,3,129);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-860,-1158,3,129);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-860,-1126,3,129);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-877,-1126,3,129);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-876,-1098,3,129);
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-858,-1098,3,129);
  quest::ze(15,"Someone in the distance barks the order, The trespassing infidels have entered the halls of ascension. Assault them, give no quarter and expect none in return!");
  quest::depop_withtimer();
}