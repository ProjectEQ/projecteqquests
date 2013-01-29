# Part of Coldain Ring 5 Quest

sub EVENT_WAYPOINT_DEPART {
  if ($wp == 19) {
    quest::settimer(1, 60);
  }
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::depop_withtimer();
}

# Quest by mystic414