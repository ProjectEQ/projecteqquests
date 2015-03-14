sub EVENT_SPAWN {
  quest::spawn2(116182,0,0,3406.9,-1722.2,142.9,191.5);
  quest::spawn2(116182,0,0,3408.7,-1693.2,142.5,191.5);
  quest::spawn2(116182,0,0,3390.1,-1744.3,146.4,191.5);
  quest::spawn2(116182,0,0,3393.8,-1777.2,149,191.5);
  quest::spawn2(116182,0,0,3395.6,-1794.3,151.6,191.5);
  quest::settimer(50,600);
}

sub EVENT_TIMER {
  if($timer==50) {
    quest::stoptimer(50);
    quest::say("The cowards seem to have fled friends, thank you for your protection.");
    quest::depopall(116182);
    quest::depop();
  }
}