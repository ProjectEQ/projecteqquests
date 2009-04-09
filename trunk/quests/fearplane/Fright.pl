#Spawns an iksar broodling on the death of the golems 75% of the time.

sub EVENT_SIGNAL {
 if($signal == 0) {
  quest::say("Such is the will of Cazic-Thule!");
 }
 elsif($signal == 1) {
  quest::say("We obey!");
 }
}

sub EVENT_DEATH {
  my $a = quest::ChooseRandom(72105,72105,72105,0);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}

#Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)