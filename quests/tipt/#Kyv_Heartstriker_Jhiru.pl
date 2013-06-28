sub EVENT_COMBAT {
  if($combat_state == 1) { 
    quest::settimer(1,1);
  } 
  if($combat_state == 0) { 
    quest::modifynpcstat("max_hit",2500); 
    quest::stoptimer(1);
  }
}

sub EVENT_TIMER {
  $x = $npc->GetX();
  $y = $npc->GetY();
  if($x < 420 || $x > 900 || $y > 2400 || $y < 2100){
    quest::modifynpcstat("max_hit",3500); 
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(289032,0,0,1411,2143,730,242);
  quest::stoptimer(1);
  #update zone status
  my $instid = quest::GetInstanceID("tipt",0);
  quest::setglobal($instid.'_tipt_status',11,7,"H6");
}