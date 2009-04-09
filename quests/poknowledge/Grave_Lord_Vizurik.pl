#Grave_Lord_Vizurik.pl
#Shadow Knight Tomes/Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("peels back the upper right portion of his thin lips, giving a dark sneer of his gruesome features and horrific maw. 'You do not belong here! Return to Selia, where the light thrives. The shadow would embrace you, should you let it, but you are here for some righteous cause - one to destroy the shadow or learn of its secrets. You will find no success here, you pathetic little light crawler. Remain here and ignore my warning, and you will condemn yourself to consumption by the shadow should you further pursue its interests.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 5166 => 1)) ||
		(plugin::check_handin(\%itemcount, 5167 => 1)) ||
		(plugin::check_handin(\%itemcount, 5168 => 1)) ||
		(plugin::check_handin(\%itemcount, 5169 => 1)) ||
		(plugin::check_handin(\%itemcount, 5171 => 1)) ||
		(plugin::check_handin(\%itemcount, 5172 => 1)) ||
		(plugin::check_handin(\%itemcount, 5173 => 1))) {#Greenmist Armor
    
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }
	
		plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
		plugin::return_items(\%itemcount);
		quest::say("I don't need this.");#Text made up
	}
#Done