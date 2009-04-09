sub EVENT_SPAWN {
  quest::settimer(1,1);
}

sub EVENT_WAYPOINT {
  $x=$npc->GetX();
  $y=$npc->GetY();
  $z=$npc->GetZ();
  if($x == 1370 && $y == -710.2 && $z == -115.6) {
    #quest::signal(113553,0);
    quest::depop();
  }
}

sub EVENT_TIMER {
  $x=$npc->GetX();
  $y=$npc->GetY();
  $z=$npc->GetZ();
  if($x == 1370 && $y == -710.2 && $z == -115.6) {
    #quest::signal(113553,0);
    quest::depop();
  }
}
#sub EVENT_DEATH {
#  quest::signal(113553,0);
#}
