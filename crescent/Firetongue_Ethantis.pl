sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("There is no such thing as too much study and learning! I feel we've only just begun to command the true power of fire, ice and magic and even teleportation. Any who feel they know all there is to know are fools!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}