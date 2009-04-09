sub EVENT_SPAWN {
    quest::settimer("223085",1800);
}

sub EVENT_AGGRO {
    quest::stoptimer("223085");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::stoptimer("223085");
    quest::depop();
} 
 }

sub EVENT_TIMER {
  if ($timer eq "223085") {
    quest::depop();
}
 }
