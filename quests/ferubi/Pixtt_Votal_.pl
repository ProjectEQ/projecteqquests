sub EVENT_SPAWN {
  quest::settimer("already_up",1);
}

sub EVENT_COMBAT {
  quest::settimer("depop_me",300);
}

sub EVENT_TIMER {
  if($timer eq "already_up") {
    if($entity_list->GetMobByNpcTypeID(284103)) {
      $npc->Depop(1);
      quest::stoptimer("already_up");
    }
  } elsif($timer eq "depop_me") {
    if($combat_state == 0) { 
      $npc->Depop(1);
      quest::stoptimer("depop_me");
    }
  }
}

sub EVENT_DEATH {
  if($entity_list->GetMobByNpcTypeID(284080)) {
    quest::spawn2(284103,0,0,$x,$y,$z,$h);
  }  
}