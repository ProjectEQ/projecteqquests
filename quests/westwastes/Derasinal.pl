sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::say("It is not often that I see strangers in these dangerous lands. Perhaps you are the chosen that Jualicn speaks of that will aid us in our battle against the foul giants. I do not believe you would be here if you were not in need of my sacred rune.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Jualicn's Token
    quest::say("I have given you the Rune of Bleve, to assist you in your research for the once lost magic against the Kromzek. I hope that you can make good use of it, for it is very sacred to me. May Veeshan guide your path!");
    quest::faction(42,10);   #Claws of Veeshan
    quest::faction(362,10);  #Yelinak
    quest::faction(189,-30); #Kromzek
    quest::exp(1000);
    quest::summonitem(1895); #Rune of Bleve
    if(!plugin::check_hasitem($client,1893) || !plugin::check_hasitem($client,1894) || !plugin::check_hasitem($client,1896)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop();
  }
  else {
    quest::say("I have no need for this item $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

#NpcID: 120014 - NpcName: Derasinal - Zone: westwastes