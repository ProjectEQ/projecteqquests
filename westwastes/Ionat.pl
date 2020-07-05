# items: 1908, 1894
sub EVENT_SAY {
  if ($faction <= 3) {
    if($text=~/hail/i) {
     quest::say("Hello $name. It is good to see that you have traveled so far to be in my presence. I do believe that you are the one chosen to aid us in our fight against the giants. If you are then I am sure that you will need my rune for your research.");
    }
    if($text=~/need your rune/i) {
     quest::say("I see. Many seek this rune that I keep for whatever magics they practice, however I can only release it to the one that aids Jualicn.");
    }
    if($text=~/aid jualicn/i) {
     quest::say("You are the one that Jualicn speaks of?  Surely you must have something to symbolize your dediciation to our cause.");
    }
  }
  else {
    quest::say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) {
  if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Jualicn's Token
    quest::say("Take this Rune of Revenge, $name. You will need it to extract retribution in remembrance of our dear Hsagra. I thank you for your contributions to our cause. It is good to have you amongst our ranks.");
    quest::faction(430,10);   #Claws of Veeshan
    quest::faction(436,10);  #Yelinak
    quest::faction(448,-30); #Kromzek
    quest::exp(1000);
    quest::summonitem(1894); #Rune of Revenge
    if(!plugin::check_hasitem($client,1893) || !plugin::check_hasitem($client,1895) || !plugin::check_hasitem($client,1896)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop_withtimer();
  }
  }
  plugin::return_items(\%itemcount);
}

#NpcID: 120017 - NpcName: Ionat - Zone: westwastes
