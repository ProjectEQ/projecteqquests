sub EVENT_SPAWN {
  quest::shout("We'll see how defiant they are after they have been crushed for our amusement. Send in one of our trained hynids!");
  quest::signalwith(282097,1,5);
  quest::settimer(1,25);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::spawn2(282099,0,0,37,540,3,189);
}