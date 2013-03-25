sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name. I have some heavy duty ruff 'n tuff storage devices for sale. You may not want to carry them 'round much, unless you're the burly type. Even the beetle box I made is kinda heavy.");
  }
  if ($text=~/beetle box/i) {
    quest::say("You're interested in it? Great! I made this beetle box from the undamaged carapace of a Rhino Beetle. It was sold to me for a very fair price in the Bazaar. Should you discover one of these pristine, undamaged carpaces, bring it to me along with 10 gold and I will make you one of your own.");
  }
}

sub EVENT_ITEM {
  my $cash = ($platinum * 1000) + ($gold * 100) + ($silver * 10) + $copper;
  if (($cash >= 1000) && plugin::check_handin(\%itemcount, 30662 => 1)) { #Pristine Rhino Beetle Carapace
    quest::emote("rattles around in a drawer and pulls out some tools and hinges. 'Ah yes, this will do. shouldn't take but a minute.'");
    quest::say("Yep! Here you are, one pristine beetle box to go and I will even throw in a little spare coin to go in it. Remember,they are quite special-you can only ever carry one.");
    quest::summonitem(17072); #Pristine Beetle Box
    quest::faction(338,5); #Traders of the Haven
    quest::faction(152,5); #House of Fordel
    quest::faction(153,5); #House of Midst
    quest::faction(154,5); #House of Stout
    quest::exp(100);
    quest::givecash(8,2,0,0); #Copper x 8, Silver x 2
  }
  else {
    quest::givecash($copper, $silver, $gold, $platinum);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:shadowhaven  ID:150231 -- Bestive_Farworth