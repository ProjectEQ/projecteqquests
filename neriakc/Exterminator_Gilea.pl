sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
    quest::say("Hello, $name. I was hired to eradicate all these pesky rodents running around the city, but there are too many of them. If you could help me by bringing back four of their whiskers I should have a few spare coins for you.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Rat Whiskers
  if(plugin::check_handin(\%itemcount, 13071 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("Well there are still many rodents around, but I will honor my deal. Here are your coins. Now I must get back to work.");
    quest::faction(87,10); # +Darkguard Inner 
    quest::faction(69,10); # +Dark Bargainers
    quest::faction(155,10); # +Indigo Brotherhood
    quest::faction(260,-10); # -Primordial Malice
    quest::exp(5);
    quest::givecash(1,1,1,0);
  }
}