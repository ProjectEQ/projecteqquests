#Assassin_Rysarieul.pl
#Rogue Tomes/Planar Armor Exchange

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::emote("performs a deep, sweeping bow in a graceful and almost flamboyant display of greetings. 'Welcome, welcome to the district of Selia, my friend. I am Assassin Rysarieul -- even the light needs its agents who walk the shadows. We lend an ear to its whispered secrets and an eye to the evils that it harbors. We are essential in this battle against the infectious corruption that threatens every corner of existence, for only we can learn of its secrets. In Selia, however, I serve as an advisor and observer more so than an active agent. The passing of time has finally taken its toll upon me -- though my people timeless in their natural long life, we do eventually grow old and wary. This is not to say that because the blade has left my hand and my feet too weak to tread upon the shards of darkness that I have abandoned my cause. I serve the cause of light still, though as a mentor to the young scouts and agents of this era of turmoil and chaos.'");
  }
}

sub EVENT_ITEM {
  if((plugin::check_handin(\%itemcount, 4901 => 1)) ||
		(plugin::check_handin(\%itemcount, 4902 => 1)) ||
		(plugin::check_handin(\%itemcount, 4903 => 1)) ||
		(plugin::check_handin(\%itemcount, 4904 => 1)) ||
		(plugin::check_handin(\%itemcount, 4905 => 1)) ||
		(plugin::check_handin(\%itemcount, 4906 => 1)) ||
		(plugin::check_handin(\%itemcount, 4907 => 1))) { #Woven Shadow Armor
    quest::say("Thank you, $name."); #Text made up
    quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981)); #Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    quest::exp(698775);
  }
  else {
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:poknowledge  ID:202009 -- Assassin_Rysarieul