sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13791 => 1)) { #Orc Scalp
    quest::say("Ah, yes. Good work, thank you.");
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}