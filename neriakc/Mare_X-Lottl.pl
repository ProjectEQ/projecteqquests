sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello there. sweetie!!  How about letting me dance for you?  Two gold and I will do a little dance for you.");
  }
  if($text=~/tayla/i) {
    quest::say("Why do you seek that little scamp when you have Mare right here? If you really want to know where she is, it will cost you. Did I ever tell you that my heart belongs to Jasper?");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10020 => 1)) { #Jasper
    quest::say("Jasper! My one and only love! All right.. That Tayla creature was lost in a game of King's Court with a very important and secret merchant. Belyea will not speak of him but that he was some sort of Baron. He did give me this trinket from his new friend and owner of the half-elf scamp. You keep it. It is worth nothing compared to sweet, beautiful Jasper.");
    quest::summonitem(54026); #Klok's Seal
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:neriakc  ID:42041 -- Mare_X`Lottl