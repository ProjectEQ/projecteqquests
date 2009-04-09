sub EVENT_SPAWN {
    quest::settimer("223083",1800);
}

sub EVENT_AGGRO {
    quest::stoptimer("223083");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::stoptimer("223083");
    quest::depop();
} 
 }

sub EVENT_TIMER {
  if ($timer eq "223083") {
    quest::depop();
}
 }
