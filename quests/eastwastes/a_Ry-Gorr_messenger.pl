# Part of Coldain Ring 5 Quest

sub EVENT_WAYPOINT {
  if ($wp == 19) {
    quest::settimer(1, 60);
  }
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::depop();
}

# Quest by mystic414