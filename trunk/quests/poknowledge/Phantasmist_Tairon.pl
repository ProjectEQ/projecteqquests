#Phantasmist_Tairon.pl
#Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("bows deeply in respect to $name. 'Good day to you and welcome to the Tanaan district of the Plane of Knowledge. The citizens of Tanaan are beings of neutrality and we strive to uphold our ways without the interference of the zealous. Do not take offense to this, my friend, for we view the same toward all sides of the coin who are extreme - those of extreme light and darkness alike are viewed warily. If you feel that our ways are not suitable for your cause in this city, then seek the district of Selia where the zealots of the light dwell respectfully without the interference of the other city’s districts. However, if you are able to yield your heart to our wishes only temporarily while in our midst, then we embrace you most warmly. The knowledge and supplies created by our adepts and craftsmen are at your disposal should you have a need of them.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 1246 => 1)) ||
		(plugin::check_handin(\%itemcount, 1247 => 1)) ||
		(plugin::check_handin(\%itemcount, 1248 => 1)) ||
		(plugin::check_handin(\%itemcount, 1249 => 1)) ||
		(plugin::check_handin(\%itemcount, 1250 => 1)) ||
		(plugin::check_handin(\%itemcount, 1251 => 1)) ||
		(plugin::check_handin(\%itemcount, 1252 => 1))) {#Insidious Armor, the comments on Alla's about this not being taken are in error, I believe.  It's Fine Insidious that's not taken.
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202244 -- Phantasmist_Tairon 

