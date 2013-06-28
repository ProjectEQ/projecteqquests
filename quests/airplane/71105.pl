#Bzzazzt - #3
sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(71107,0,0,$x,$y,$z,$h); #Bazzazzt #3-1
}