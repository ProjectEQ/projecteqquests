#Trelli_Steelswinger.pl
#Berserkter Tomes/Planar Armor Exchange

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 55601 => 1)) ||
		(plugin::check_handin(\%itemcount, 55602 => 1)) ||
		(plugin::check_handin(\%itemcount, 55603 => 1)) ||
		(plugin::check_handin(\%itemcount, 55604 => 1)) ||
		(plugin::check_handin(\%itemcount, 55605 => 1)) ||
		(plugin::check_handin(\%itemcount, 55606 => 1)) ||
		(plugin::check_handin(\%itemcount, 55607 => 1))) {#Shadow Rage Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }
   plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
   plugin::return_items(\%itemcount);
}#Done