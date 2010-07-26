#Bzzazzt - #1
sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(71103,0,0,$x+10,$y,$z,$h); #Bazzazzt #1-1
  quest::spawn2(71103,0,0,$x-10,$y,$z,$h); #Bazzazzt #1-2
}