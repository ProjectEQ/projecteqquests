sub EVENT_DEATH_COMPLETE {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
  quest::spawn2(228122,0,0,$x,$y,$z,$h); #Fist_of_Krasnok
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
  }
}