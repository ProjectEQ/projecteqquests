sub EVENT_SPAWN {
  quest::pause(2);
  $archer = undef;
}

sub EVENT_WAYPOINT {
  if($archer < 8){
    quest::pause(273);
    $archer=$archer+1;
  }
  elsif($archer == 8) {
    $archer=$archer+1;
  }
  elsif($archer > 8 && $archer < 16) {
    $archer=$archer+1;
  }
  elsif($archer == 16) {
    $archer=$archer+1;
    quest::pause(155);
    quest::modifynpcstat("runspeed",2.5);
  }
  elsif($archer > 16 && $archer < 24) {
    $archer=$archer+1;
    quest::pause(155);
    quest::modifynpcstat("runspeed",2.5);
    quest::settimer(9,755);
  }
}

sub EVENT_TIMER {
  if($timer == 9) {
    quest::depopall(116555);
  }
}