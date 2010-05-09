sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("My attempts to help Nedaria have made her worse.  I have sent a scout to tell Morden and Tondal to return as soon as possible.  I don't know what to do now.  I . . . have failed my . . . dearest friends.");
  }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}