sub EVENT_SPAWN {
    quest::settimer("223079",1800);
}

sub EVENT_AGGRO {
    quest::stoptimer("223079");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::stoptimer("223079");
    quest::depop();
} 
 }

sub EVENT_TIMER {
  if ($timer eq "223079") {
    quest::depop();
}
 }

