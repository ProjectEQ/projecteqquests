sub EVENT_SAY {
  #if(quest::istaskactive()) { #Task: Hate's Fury Setting Sail
    if($text=~/hail/i) {
      quest::say("Hmph, so you're going to stop the Hate's Fury from sailing? Well at least it will be entertaining to watch them wash your blood from the decks. Let me know when you're ready to [board the ship].");
    }
    if($text=~/board the ship/i) {
      quest::say("Off we go, I'll be waiting for you when you're done. . . If you're still alive that is.");
      #quest::movegroup(); #Hate's Fury Instance
    }
  #}
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
