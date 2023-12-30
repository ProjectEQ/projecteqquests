sub EVENT_WAYPOINT_ARRIVE {
  if ($wp == 15) {
    quest::settimer("greet", 4);
  }
}

sub EVENT_WAYPOINT_DEPART {
  if ($wp == 24) {
    quest::say("Hmmmm. Interesting. Very interesting!");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::settimer("found", 4);
  }
  if ($signal == 2) {
    quest::settimer("looking", 4);
  }
}

sub EVENT_TIMER {
  if ($timer eq "greet") {
    quest::stoptimer("greet");
    quest::say("Hello, Hemfar. I hope you are well! Have you been able to locate the tome I requested?");
    quest::signalwith(394227, 1);
  }
  if ($timer eq "found") {
    quest::stoptimer("found");
    quest::say("Many thanks, Hemfar. I hope you didn't have to go to too much effort on my account.");
  }
  if ($timer eq "looking") {
    quest::stoptimer("looking");
    quest::say("That's quite all right, Hemfar. If anyone can find what I'm looking for, I know you can!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}