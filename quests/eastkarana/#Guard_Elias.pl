sub EVENT_SPAWN {
  quest::settimer(30)
}

sub EVENT_TIMER {
  quest::stoptimer();
  quest::start()
}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 26) { 
    quest::say("Hello, Milea. It is unfortunate for you that your friends have led me right to you. Soon you will join Nerissa in the afterlife. Do you have any last words?");
    quest::signalwith(15055,1,4);

}

sub EVENT_SIGNAL {
  if ($signal == 1) { 
    quest::say("I thought you would never ask.");
    quest::attacknpctype(15055);
}
}