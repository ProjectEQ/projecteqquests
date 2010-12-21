sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::say("Hello $name. It is good to see that you have traveled so far to be in my presence. I do believe that you are the one chosen to aid us in our fight against the giants. If you are then I am sure that you will need my rune for your research.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Jualicn's Token
    quest::say("Take this Rune of Revenge, $name. You will need it to extract retribution in remembrance of our dear Hsagra. I thank you for your contributions to our cause. It is good to have you amongst our ranks.");
    quest::faction(42,10);   #Claws of Veeshan
    quest::faction(362,10);  #Yelinak
    quest::faction(189,-30); #Kromzek
    quest::exp(1000);
    quest::summonitem(1894); #Rune of Revenge
    if(!plugin::check_hasitem($client,1893) || !plugin::check_hasitem($client,1895) || !plugin::check_hasitem($client,1896)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop();
  } 
  else {
    quest::say("I have no need for this item $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

#NpcID: 120017 - NpcName: Ionat - Zone: westwastes