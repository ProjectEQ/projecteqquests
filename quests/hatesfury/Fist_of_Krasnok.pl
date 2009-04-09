sub EVENT_DEATH { 
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(228122,0,0,$x,$y,$z,$h); #spawn a new fist
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }