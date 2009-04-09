sub EVENT_SPAWN {
    quest::settimer("223084",1800);
}

sub EVENT_AGGRO {
    quest::stoptimer("223084");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::stoptimer("223084");
    quest::depop();
} 
 }

sub EVENT_TIMER {
  if ($timer eq "223084") {
    quest::depop();
}
 }
