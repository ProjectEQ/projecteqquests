sub EVENT_SPAWN {
    quest::settimer("223082",1800);
}

sub EVENT_AGGRO {
    quest::stoptimer("223082");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::stoptimer("223082");
    quest::depop();
} 
 }

sub EVENT_TIMER {
  if ($timer eq "223082") {
    quest::depop();
}
 }
