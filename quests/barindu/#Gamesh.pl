sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I don't know why you would want to, but if you want me to tell you the way to one of the different areas of the sewers let me know.  I know how to get to the treatment [plant], [crematory], [pools] of sludge, or the [lair] of trapped ones.");
  }
  if ($text=~/plant/i) {
    quest::say("Ok, listen closely...");
    #do instance thing
  }
  if ($text=~/crematory/i) {
    quest::say("Ok, listen closely...");
    #do instance thing
}
if ($text=~/pools/i) {
    quest::say("Ok, listen closely...");
    #do instance thing
}
if ($text=~/lair/i) {
    quest::say("Ok, listen closely...");
    #do instance thing
}
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}