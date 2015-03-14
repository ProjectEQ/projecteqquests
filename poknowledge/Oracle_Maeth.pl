#Oracle_Maeth.pl
#Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::emote("makes a sweeping motion with his arms in an almost ritualistic fashion of greetings known only to those of the shamanistic world. 'We welcome you, friend, to the Tanaan district of the Plane of Knowledge. Beyond a seemingly endless fount of tangible supplies, the adepts of Jeral have come together and offered to retake our former duties as guildmasters and mentors to those of our art. In my life before New Tanaan's embrace of me, I served as one of many shamans of the Northmen, before Halas' walls were secured in the turmoil of the frozen north. As the years passed and years fell way to decades, I ascended to hold the seat of guild master of my order and have mentored countless shamans in my day. If you are in need of such knowledge, then please, do not hesitate in acquiring my aid.'");
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
}#END of FILE Zone:poknowledge  ID:202245 -- Oracle_Maeth 
