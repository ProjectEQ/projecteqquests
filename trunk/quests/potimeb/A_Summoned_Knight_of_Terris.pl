sub EVENT_SPAWN {
    quest::settimer("223081",1800);
}

sub EVENT_AGGRO {
    quest::stoptimer("223081");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::stoptimer("223081");
    quest::depop();
} 
 }

sub EVENT_TIMER {
  if ($timer eq "223081") {
    quest::depop();
}
 }
