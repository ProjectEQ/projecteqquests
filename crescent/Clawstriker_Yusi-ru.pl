sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Vasha, $name. We must all realize that an ant may well destroy a whole dam. And even a hare will bite when it is cornered. These are some of the teachings of the monks of the Fangs of the Dragon that remind us of how we learn from the world to make us stronger.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}