sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
    quest::say("I really can't believe it, $name. I have seen Qeynos in bad shape but this is unbelievable! The rodents have practically taken over our city. If you see some of them running around, keep the rat whiskers, and I will reward you for every four you bring me.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Rat Whiskers
  if(plugin::check_handin(\%itemcount, 13071 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("Here is something for you, $name. I certainly appreciate your help with our pest problem here. Great work.");
    quest::faction(9,10); # +Antonius Bayle
    quest::faction(135,10); # +Guards of Qeynos
    quest::faction(217,10); # +Merchants of Qeynos
    quest::faction(33,-10); # -Circle of Unseen Hands
    quest::faction(53,-10); # -Corrupt Qeynos Guards
    quest::exp(5);
    quest::givecash(1,1,1,0);
 }
}