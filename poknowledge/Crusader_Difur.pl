#Crusader_Difur.pl
#Paladin Tomes/Planar Armor Exchange
# items: 4851, 4852, 4853, 4854, 4855, 4856, 4857, 10028, 10037, 22503, 15981

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("kneels before $name in humble recognition. The clang of his spotless, dwarven crafted armor against the stone floor briefly chimes through the hall. The song of steel and marble is echoed by his gruff, iron voice. 'I am Difur, Crusader of Brell Serillis and master of the paladins in the district of Tanaan. If ye seek knowledge and wisdom of the justly knights of Norrath than I, most humbly, am at yer service, traveler.'");
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4851 => 1)) ||
		(plugin::check_handin(\%itemcount, 4852 => 1)) ||
		(plugin::check_handin(\%itemcount, 4853 => 1)) ||
		(plugin::check_handin(\%itemcount, 4854 => 1)) ||
		(plugin::check_handin(\%itemcount, 4855 => 1)) ||
		(plugin::check_handin(\%itemcount, 4856 => 1)) ||
		(plugin::check_handin(\%itemcount, 4857 => 1))) {#Valorium Armor
    	
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }

		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
		plugin::return_items(\%itemcount);
	}


#END of FILE Zone:poknowledge  ID:202249 -- Crusader_Difur 

