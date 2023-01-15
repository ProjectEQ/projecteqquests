# items: 13071
sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
    quest::say("Greetings, traveller. How would you like to make some money? I was brought in to kill some of these rodents that have been infesting the city but there are simply way too many of them. If you can kill some of the rodents around here and bring me four rat whiskers, perhaps I could find some spare coin for you.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Rat Whiskers
  if(plugin::check_handin(\%itemcount, 13071 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("Well there are still many rodents around but I will honor my deal. Here are your coins. Now I must get back to work.");
    quest::faction(370,10); # +Dreadguard Inner
    quest::faction(334,10); # +Dreadguard Outer
    quest::faction(270,10); # +Indigo Brotherhood
    quest::faction(1522,-10); # -Primordial Malice
    quest::exp(5);
    quest::givecash(1,1,1,0);
  }
}
