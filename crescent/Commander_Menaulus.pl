sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Vasha, young warrior.  I found myself in Crescent Reach but a few months ago, but as it turns out, I'm extremely handy with weapons and battle strategy.  That's how I came to be named the guildmaster of the Scaleguard -- our city's warriors.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}