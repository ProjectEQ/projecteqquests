#Bzzazzt - #2
sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(71106,0,0,$x+10,$y,$z,$h); #Bazzazzt #2-1
  quest::spawn2(71106,0,0,$x-10,$y,$z,$h); #Bazzazzt #2-2
  quest::spawn2(71106,0,0,$x   ,$y,$z,$h); #Bazzazzt #2-3
}