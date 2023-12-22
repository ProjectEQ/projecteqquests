sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to Crescent Reach, young one. The Crystalwing Order, my guild of devout clerics, serves to ensure the health and welfare of all of our city's drakkin and allies. These are uncertain times for all as we drakkin find footing in this world.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}