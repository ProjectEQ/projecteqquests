#Grandmaster_Limsa.pl
#Monk Tomes/Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("closes his eyes and gives a deep-seated bow before $name. 'Greetings, traveler. I am Grand Master Limsa, master of the tranquil order of the Tanaan district of the Plane of Knowledge. Monks of both Norrathian orders may approach me for guidance and knowledge through the long path of self-mastery and discipline.'");
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 1201 => 1)) ||
		(plugin::check_handin(\%itemcount, 1202 => 1)) ||
		(plugin::check_handin(\%itemcount, 1203 => 1)) ||
		(plugin::check_handin(\%itemcount, 1204 => 1)) ||
		(plugin::check_handin(\%itemcount, 1205 => 1)) ||
		(plugin::check_handin(\%itemcount, 1206 => 1))) {#Shiverback-hide Armor
    
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }	
	
		plugin::try_tome_handins(\%itemcount, $class, 'Monk');
		plugin::return_items(\%itemcount);
		#quest::say("I don't need this.");#Text made up
	}
#END of FILE Zone:poknowledge  ID:202247 -- Grandmaster_Limsa 