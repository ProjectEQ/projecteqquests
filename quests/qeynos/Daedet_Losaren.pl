sub EVENT_ITEM {
  if ($gold == 20) {
    quest::say("This should help you remain safe.");
    quest::castspell(11);
  }
}