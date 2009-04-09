sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest (Scripted By: Fatty Beerbelly)
    quest::say("Hello, $name. Have you seen these pesky rodents? They are everywhere, and I simply cannot stand them! If you are willing to do a little cleaning up of the pests here, I will reward you for every four rat whiskers you bring me.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Rat Whiskers
  if(plugin::check_handin(\%itemcount, 13071 => 4)){ #End of Exterminate the Vermin (Scripted By: Fatty Beerbelly)
    quest::say("I am very impressed, $name! A few more cleaners like yourself and we could have a rodent-free Qeynos in no time!");
    quest::faction(135,10); # +Guards of Qeynos
    quest::faction(9,10);   # +Antonius Bayle
    quest::faction(217,10); # +Merchants of Qeynos
    quest::faction(53,-10); # -Corrupt Qeynos Guards
    quest::faction(33,-10); # -Circle of Unseen Hands
    quest::exp(5);
    quest::givecash(1,1,1,0);
  }
}