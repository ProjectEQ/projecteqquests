#Grave_Lord_Dreavud.pl
#Shadow Knight Tomes/Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("peels back the upper right portion of his thin lips, giving a dark sneer of his gruesome features and horrific maw. 'You do not belong here! Return to Selia, where the light thrives. The shadow would embrace you, should you let it, but you are here for some righteous cause - one to destroy the shadow or learn of its secrets. You will find no success here, you pathetic little light crawler. Remain here and ignore my warning, and you will condemn yourself to consumption by the shadow should you further pursue its interests.'");
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4841 => 1)) ||
		(plugin::check_handin(\%itemcount, 4842 => 1)) ||
		(plugin::check_handin(\%itemcount, 4843 => 1)) ||
		(plugin::check_handin(\%itemcount, 4844 => 1)) ||
		(plugin::check_handin(\%itemcount, 4845 => 1)) ||
		(plugin::check_handin(\%itemcount, 4846 => 1)) ||
		(plugin::check_handin(\%itemcount, 4847 => 1))) {#Umbral Armor
    
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
	
		plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
		plugin::return_items(\%itemcount);

}

#END of FILE Zone:poknowledge  ID:202259 -- Grave_Lord_Dreavud 