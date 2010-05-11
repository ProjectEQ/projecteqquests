sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name, how are you today? My name is Madronoa and I have recently returned from the Prayer Grounds of Calling. A group of young adventurers such as yourself led me there some time ago. While there I learned of the geomantic barrier that prevents others from entering and I've learned how to channel the energy of that barrier to teleport those such as yourself there. However, you must have acquired the Fragment and Sliver of the High Temple to be able to get past the unseen force preventing adventurers from entering. If you have both of these pieces and to travel to Qvic, I shall create a portal for you.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}