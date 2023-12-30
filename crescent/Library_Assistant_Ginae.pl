sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello there. You are welcome to look around the library. Please keep your voice down, people like to study here.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}