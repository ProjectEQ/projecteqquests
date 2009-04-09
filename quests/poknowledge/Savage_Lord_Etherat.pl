#Savage_Lord_Etherat.pl
#Beastlord Tomes/Planar Armor Exchange
#I added the tome handin, it didn't exist previously - Kilelen

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("performs an ancient, graceful gesture that is seemingly arcane in nature, though no energy can be felt entering or dispersing in the room. 'Tanaan welcomes you to its midst, traveler, There is much to be found in the whole of New Tanaan and specifically, the great library of Myrist. However, there is only so much that the tangible world can teach you. friend. for true, infinite knowledge lies eternally beyond the confines of material and astral domains. Within yourself. your very spirit and the spirits that surround you lays the key to true enlightenment and self-progress. Should you follow the path of the Beastlords. then I may be of aid in guiding your further toward the realization of your potential and the true elements surrounding you.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 7817 => 1)) ||
		(plugin::check_handin(\%itemcount, 7818 => 1)) ||
		(plugin::check_handin(\%itemcount, 7819 => 1)) ||
		(plugin::check_handin(\%itemcount, 7832 => 1)) ||
		(plugin::check_handin(\%itemcount, 7833 => 1)) ||
		(plugin::check_handin(\%itemcount, 7834 => 1)) ||
		(plugin::check_handin(\%itemcount, 7835 => 1))) {#Anthemion Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }

		plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
		plugin::return_items(\%itemcount);
		quest::say("I don't need this.");#Text made up
	}
#END of FILE Zone:poknowledge  ID:202234 -- Savage_Lord_Etherat