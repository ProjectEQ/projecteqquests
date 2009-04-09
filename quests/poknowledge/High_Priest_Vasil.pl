#High_Priest_Vasil.pl
#Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("closes his eyes and gives a deep, formal bow before $name. 'Welcome to Jeral, friend. I am Vasil, High Priest of Brell Serillis and resident master of the clerical arts in the district of Tanaan. If you have come in search of a mentor to guide you through the skills of your priesthood, then do not be discouraged by my own declaration of faith should it differ from yours. I cannot teach you how to know and be close to your deity in life, for only you may know that individually, but I can impart to you the fundamental basics that every priest, despite the object of their undying faith and devotion, wields in their life of service.'");
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4881 => 1)) ||
		(plugin::check_handin(\%itemcount, 4882 => 1)) ||
		(plugin::check_handin(\%itemcount, 4883 => 1)) ||
		(plugin::check_handin(\%itemcount, 4884 => 1)) ||
		(plugin::check_handin(\%itemcount, 4885 => 1)) ||
		(plugin::check_handin(\%itemcount, 4886 => 1)) ||
		(plugin::check_handin(\%itemcount, 4887 => 1))) {#Ethereal Mist Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
}#END of FILE Zone:poknowledge  ID:202246 -- High_Priest_Vasil 
