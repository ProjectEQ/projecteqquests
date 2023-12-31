sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, young one.  If you find yourself searching for your mortal remains, I may be of [" . quest::saylink("aid") . "].  Our brotherhood offers its services for free to those just beginning their journey in life.");
  }
  if ($text=~/aid/i) {
    $client->Message(1, "As the priest begins to chant, shadows slowly coalesce into a wispy mass that feels vaguely familiar.  After a few moments, the shadows recede and all the remains of your former life appear before you.");
    #summon corpses here
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}