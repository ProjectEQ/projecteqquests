sub EVENT_DEATH_COMPLETE {
  my $guess = quest::ChooseRandom(1,2,3);
  if ($guess == 1) {
    quest::spawn2(218054,0,0,$x,$y,$z,$h); # NPC: A_Miniature_Dustrunner
  }
  if ($guess == 2) {
    quest::spawn2(218054,0,0,$x,$y,$z,$h); # NPC: A_Miniature_Dustrunner
	quest::spawn2(218054,0,0,$x,$y,$z,$h); # NPC: A_Miniature_Dustrunner
  }
  if ($guess == 3) {
    quest::spawn2(218054,0,0,$x,$y,$z,$h); # NPC: A_Miniature_Dustrunner
	quest::spawn2(218054,0,0,$x,$y,$z,$h); # NPC: A_Miniature_Dustrunner
	quest::spawn2(218054,0,0,$x,$y,$z,$h); # NPC: A_Miniature_Dustrunner
  }
}
