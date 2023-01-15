# items: 1908, 1895
sub EVENT_SAY {
  if ($faction <= 3) {
    if($text=~/hail/i) {
     quest::say("It is not often that I see strangers in these dangerous lands. Perhaps you are the chosen that Jualicn speaks of that will aid us in our battle against the foul giants. I do not believe you would be here if you were not in need of my sacred rune.");
    }
    if($text=~/need your rune/i) {
     quest::say("Although I can see that you would surely put the rune to use in some way, I can only release it to the one that Jualicn speaks of. I am sorry, but I am quite protective to what ties I still have to the great Relinar.");
    }
    if($text=~/aid jualicn/i) {
     quest::say("I understand that you may know of Jualicn, but I can only deal with those that he would trust with something dear to him.");
    }
  }
  else {
    quest::say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) {
  if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Jualicn's Token
    quest::say("I have given you the Rune of Bleve, to assist you in your research for the once lost magic against the Kromzek. I hope that you can make good use of it, for it is very sacred to me. May Veeshan guide your path!");
    quest::faction(430,10);   #Claws of Veeshan
    quest::faction(436,10);  #Yelinak
    quest::faction(448,-30); #Kromzek
    quest::exp(1000);
    quest::summonitem(1895); #Rune of Bleve
    if(!plugin::check_hasitem($client,1893) || !plugin::check_hasitem($client,1894) || !plugin::check_hasitem($client,1896)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop_withtimer();
  }
  }
  plugin::return_items(\%itemcount);
}

#NpcID: 120014 - NpcName: Derasinal - Zone: westwastes
