sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings offlander. I see you are exploring our beloved Keep. By order of the Dain all offlanders that have been friendly to our people are permitted to explore all parts of Icewell Keep save this door I guard. Enjoy your stay.");
  }
  if($text=~/door/i) {
    quest::say("Why this door behind me which I stand in front of course. You didn't by chance fall on the ice and hit your head I hope good $race. By order of the Dain, none are permitted to see or go beyond this entrance.");
  }
  if($text=~/beyond this entrance/i) {
    quest::say("Why beyond this door lies the most wonderous. . . oh wait, I can't tell you that $race. All I can tell you is that the door has also been magically sealed by our Grand Historian. Please move along now and enjoy the rest of the Keep.");
  }
}

sub EVENT_ITEM {
  quest::say("I do not what this.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadinb  ID:129055 -- Sentinel_Paxin