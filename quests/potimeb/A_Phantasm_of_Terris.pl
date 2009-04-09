sub EVENT_SPAWN {
    quest::settimer("223080",1800);
}

sub EVENT_AGGRO {
    quest::stoptimer("223080");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::stoptimer("223080");
    quest::depop();
} 
 }

sub EVENT_TIMER {
  if ($timer eq "223080") {
    quest::depop();
}
 }
