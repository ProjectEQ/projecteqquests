sub EVENT_SPAWN {
  quest::pause(2);
  $wolf = undef;
}

sub EVENT_WAYPOINT {
  if($wolf < 8){
    quest::pause(273);
    $wolf=$wolf+1;
  }
  elsif($wolf == 8) {
    $wolf=$wolf+1;
  }
  elsif($wolf > 8 && $wolf < 16) {
    $wolf=$wolf+1;
  }
  elsif($wolf == 16) {
    $wolf=$wolf+1;
    quest::pause(155);
    quest::modifynpcstat("runspeed",2.5);
  }
  elsif($wolf > 16 && $wolf < 24) {
    $wolf=$wolf+1;
    quest::pause(155);
    quest::modifynpcstat("runspeed",2.5);
    quest::settimer(10,755);
  }
}

sub EVENT_TIMER {
  if($timer == 10) {
    quest::depopall(116563);
  }
}