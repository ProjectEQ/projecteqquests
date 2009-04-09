sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
    quest::say("Pleased to meet you! If you are a newcomer to Freeport then you can clearly see we are having quite the rat problem. If you are interested, the militia has granted me some coin to reward those that bring me four rat whiskers.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Rat Whiskers
  if(plugin::check_handin(\%itemcount, 13071 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("This is good work! I know this isn't much, but it is all I can offer you. Thanks for your help!");
    quest::faction(48,10); # +Coalition of Tradefolk Underground
    quest::faction(105,10); # +Freeport Militia
    quest::faction(184,-10); # -Knights of Truth
    quest::faction(258,-10); # -Priests of Marr
    quest::exp(5);
    quest::givecash(1,1,1,0);
 }
}
