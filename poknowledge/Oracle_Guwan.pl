#Oracle_Guwan.pl
#Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::emote("curls back his thin, reptilian-like lips, baring a two rows of jagged, unkempt teeth in a sinister sneer of hate. 'Little worm speaks? How quaint and disgusting you are, worm, and how pathetic. Begone from Kartis, little worm, you do not belong among the shadows. Your ears will melt when the shadow speaks the secrets of its mind and infinite memory. But. . . hehehe. . . but. yes. maybe you little worms think yourselves beyond the shadow's venomous tongue. . . maybe you are. . . heheheh. . . maybe you should stay, worm, and learn from Guwan. He knows much of the shadow's words, the shadow that taints and subdues the world of spirits to its will. Yes, stay worm, and learn from the shadow. . . see how. . . hehehehe. . . see how brave you truly are.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4871 => 1)) ||
		(plugin::check_handin(\%itemcount, 4872 => 1)) ||
		(plugin::check_handin(\%itemcount, 4873 => 1)) ||
		(plugin::check_handin(\%itemcount, 4884 => 1)) ||
		(plugin::check_handin(\%itemcount, 4874 => 1)) ||
		(plugin::check_handin(\%itemcount, 4875 => 1)) ||
		(plugin::check_handin(\%itemcount, 4876 => 1)) ||
		(plugin::check_handin(\%itemcount, 4877 => 1))) {#Rune Etched Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202253 -- Oracle_Guwan