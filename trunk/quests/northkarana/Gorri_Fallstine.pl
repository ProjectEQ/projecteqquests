sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I'm afraid I can't speak right now, $name.  I'm waiting for someone very important to arrive.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10307 => 4) || plugin::check_handin(\%itemcount, 10307 => 3) || plugin::check_handin(\%itemcount, 10307 => 2) || plugin::check_handin(\%itemcount, 10307 => 1)) {
    quest::say("Ah, yes. Thank you, $name.");
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}