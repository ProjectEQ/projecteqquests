sub EVENT_DEATH {
  my $guess = quest::ChooseRandom(1,2,3);
  if ($guess == 1) {
    quest::spawn2(218054,0,0,$x,$y,$z,$h);
  }
  if ($guess == 2) {
    quest::spawn2(218054,0,0,$x,$y,$z,$h);
	quest::spawn2(218054,0,0,$x,$y,$z,$h);
  }
  if ($guess == 3) {
    quest::spawn2(218054,0,0,$x,$y,$z,$h);
	quest::spawn2(218054,0,0,$x,$y,$z,$h);
	quest::spawn2(218054,0,0,$x,$y,$z,$h);
  }
}
