sub EVENT_SPAWN {
    quest::settimer("223086",1800);
}

sub EVENT_AGGRO {
    quest::stoptimer("223086");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::stoptimer("223086");
    quest::depop();
} 
 }

sub EVENT_TIMER {
  if ($timer eq "223086") {
    quest::depop();
}
 }
