#Warlord_Shriek.pl
#Warrior Tomes/Planar Armor Exchange
#Created file, added warrior tomes as well -Kilelen

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 5174 => 1)) ||
		(plugin::check_handin(\%itemcount, 5175 => 1)) ||
		(plugin::check_handin(\%itemcount, 5176 => 1)) ||
		(plugin::check_handin(\%itemcount, 5177 => 1)) ||
		(plugin::check_handin(\%itemcount, 5178 => 1)) ||
		(plugin::check_handin(\%itemcount, 5179 => 1)) ||
		(plugin::check_handin(\%itemcount, 5180 => 1)) ||
		(plugin::check_handin(\%itemcount, 5181 => 1))) {#Legionnaire Scale Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
   plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
   plugin::return_items(\%itemcount);
}#Done