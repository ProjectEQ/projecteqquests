#This is an add spawned during the Shei Vinitras fight. If anyone is killed by this mob, a random mob (of 4 possible) will spawn.

sub EVENT_SLAY {
  my $a = quest::ChooseRandom(179161,179147,179160,179142);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
}

#Submitted by Jim Mills