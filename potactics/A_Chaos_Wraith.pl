sub EVENT_SIGNAL {
  if($signal == 90) {
    quest::settimer("depop_wraith",1110);
  }
}
 
sub EVENT_TIMER {
  if($timer eq "depop_wraith") {
    quest::depop();
  }
} 

sub EVENT_COMBAT {
    if($combat_state == 0) {
        $npc->SaveGuardSpot($x, $y, $z, $h);
    }
}
