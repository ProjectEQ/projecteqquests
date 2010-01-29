sub EVENT_SPAWN {
  quest::pause(2);
  $priest = undef;
}

sub EVENT_WAYPOINT_DEPART {
  if($priest < 8){
    quest::pause(273);
    $priest=$priest+1;
  }
  elsif($priest == 8) {
    $priest=$priest+1;
  }
  elsif($priest > 8 && $priest < 16) {
    $priest=$priest+1;
  }
  elsif($priest == 16) {
    $priest=$priest+1;
    quest::pause(155);
    quest::modifynpcstat("runspeed",2.5);
  }
  elsif($priest > 16 && $priest < 24) {
    $priest=$priest+1;
    quest::pause(155);
    quest::modifynpcstat("runspeed",2.5);
    quest::settimer(8,755);
  }
}

sub EVENT_TIMER {
  if($timer == 8) {
    quest::depopall(116541);
  }
}