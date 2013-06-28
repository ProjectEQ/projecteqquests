# This is to spawn a lesser spirit upon an_iksar_marauder's death for Shaman epic 1.0

sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(78211,0,0,$x,$y,$z,$h);
}


#Submitted by: Jim Mills