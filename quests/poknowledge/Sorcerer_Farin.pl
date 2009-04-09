#Sorcerer_Farin.pl
#Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("gives a deep, respectful nod of his head toward $name. 'Welcome, $name. I am Sorcerer Farin, ancient wizard of Erudin and head sorcerer of Selia. In light of your arrival, those who walk the path of light and hold the virtues of honor and justice high in their spirits. I offer my aid to any that would be so obliged as to accept it. In my former years, I was one of few guild masters in the newfound city of Erudin and what knowledge I have of that past is at your disposal.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 1225 => 1)) ||
		(plugin::check_handin(\%itemcount, 1226 => 1)) ||
		(plugin::check_handin(\%itemcount, 1227 => 1)) ||
		(plugin::check_handin(\%itemcount, 1228 => 1)) ||
		(plugin::check_handin(\%itemcount, 1229 => 1)) ||
		(plugin::check_handin(\%itemcount, 1230 => 1)) ||
		(plugin::check_handin(\%itemcount, 1231 => 1))) {#Carmine Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }	
}#END of FILE Zone:poknowledge  ID:202242 -- Sorcerer_Farin