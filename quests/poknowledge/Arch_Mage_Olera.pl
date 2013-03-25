#Arch_Mage_Olera.pl
#Planar Armor Exchange/Magician Tomes

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("gives an almost unearthly graceful gesture in warm welcoming of $name. 'May the light of honor, valor, and untainted passion guide you through the dark turmoil of this dreaded era. I am very pleased to see you before us, friend, for the children of the light must all come together in this dark hour of Norrath and the universe's fate. If you have need of guidance in the ways of the elements, then what humble knowledge I have is at your disposal, my friend.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 1239 => 1)) ||
		(plugin::check_handin(\%itemcount, 1240 => 1)) ||
		(plugin::check_handin(\%itemcount, 1241 => 1)) ||
		(plugin::check_handin(\%itemcount, 1242 => 1)) ||
		(plugin::check_handin(\%itemcount, 1243 => 1)) ||
		(plugin::check_handin(\%itemcount, 1244 => 1)) ||
		(plugin::check_handin(\%itemcount, 1245 => 1))) {#Apothic Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge  ID:202240 -- Arch_Mage_Olera