sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
    quest::say("Hello dere. Do you see all dese darn critters running around here? Dere are little armadillos everywhere! We need to git rid of dem. If you bring me four of dere husks, I pay you money. Too many for me to smash alone.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Armadillo Husks
  if(plugin::check_handin(\%itemcount, 19195 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("You smashed dem gud. Take dese coins!");
    quest::faction(232,10); # +Oggok Guards
    quest::faction(233,10); # +Oggok Residents
    quest::faction(46,10); # +Clurg
    quest::exp(500);
    quest::givecash(1,1,1,0);
  }
  plugin::return_items(\%itemcount);
}

  
