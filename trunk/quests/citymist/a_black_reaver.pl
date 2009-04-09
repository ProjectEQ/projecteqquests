# respawn random mob on a black reaver death - list favors another reaver respawn
# 75% of the time

sub EVENT_DEATH {
  my $a = quest::ChooseRandom(90004,90004,90004,90005,90005,90005,90006,90006,90006,90174,90180,90182,90184);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}

# EOF zone: citymist ID: 90004 90005 90006 NPC: a_black_reaver

