sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13418 => 1)) {
    if(quest::istaskactivityactive(141,4)) {
      quest::say("Ah, yes. Thank you.");
    }
    else {
      quest::say("I have no use for this, $name.");
      quest::summonitem(13418);
    }
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}