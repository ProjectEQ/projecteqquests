#Bazzazzt - #3
sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(71101,0,0,$x,$y,$z,$h); #Bzzzt
}