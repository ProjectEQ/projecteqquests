sub EVENT_SPAWN {
  quest::pause(2);
  $paladin = undef;
}

sub EVENT_WAYPOINT {
  if($paladin < 8){
    $paladin=$paladin+1;
    quest::pause(273);
  }
  elsif($paladin == 8) {
    $paladin=$paladin+1;
  }
  elsif($paladin > 8 && $paladin < 16) {
    $paladin=$paladin+1;
  }
  elsif($paladin == 16) {
    $paladin=$paladin+1;
    quest::pause(155);
    quest::modifynpcstat("runspeed",2.5);
  }
  elsif($paladin > 16 && $paladin < 23) {
    $paladin=$paladin+1;
    quest::pause(155);
    quest::modifynpcstat("runspeed",2.5);
    quest::settimer(7,755);
  }
}

sub EVENT_TIMER {
  if($timer == 7) {
    quest::depopall(116549);
  }
}