# #115200 Templar Tingar

sub EVENT_SPAWN {
  quest::settimer(1,480); #Make him say speech every 8 mins
  quest::settimer(2,840); #Make him say second part speech 14 mins
}

sub EVENT_TIMER {
  if ($timer == 1) {
    quest::say("Oh Brell, what ever did I do to inspire your wrath?");
  }
  if ($timer == 2) {
    quest::say("Ok, let's try this again.");
    quest::say("ROYGHT FACE!");
  }
}