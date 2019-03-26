sub EVENT_DEATH_COMPLETE {
  $x = $npc->GetX();
  $y = $npc->GetY();		
  $z = $npc->GetZ();		
  $h = $npc->GetHeading();
    quest::spawn2(172182, 0, 0, $x, $y, $z, $h); # NPC: #Hoober

}