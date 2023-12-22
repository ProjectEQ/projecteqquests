sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("We must be ever watchful of the spirits, $name. They not only guide us and give us strength, they protect us and must be protected. That is the Spirit Watchers' way.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}