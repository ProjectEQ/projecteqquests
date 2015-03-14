sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::say("Eh, what do you mean by peculiar?");
  }
  if ($signal == 2) {
    quest::say("Whoa! What did you do?");
  }
}