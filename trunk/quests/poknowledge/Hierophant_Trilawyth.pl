#Hierophant_Trilawyth.pl
#Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("gives a gentle bow of his head in respect toward $name. 'The district of Tanaan welcomes you, traveler. The adepts of the city have come together collectively and as individuals in hopes of aiding our visitors as we are able. In my time upon Norrath, I served as a child of nature dedicated to Tunare, the Mother of All. Though my faith has not wavered and my philosophies of nature have only grown in this astral city, I am able to train any druid who is in need of gaining a better grasp upon their skills. Mind you, however, that I am not a preacher and will not guide you through the instruction of faith or spell, for it is these things you must acquire and perfect through your own trials.'");
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 3801 => 1)) ||
		(plugin::check_handin(\%itemcount, 3802 => 1)) ||
		(plugin::check_handin(\%itemcount, 3803 => 1)) ||
		(plugin::check_handin(\%itemcount, 3804 => 1)) ||
		(plugin::check_handin(\%itemcount, 3805 => 1)) ||
		(plugin::check_handin(\%itemcount, 3806 => 1)) ||
		(plugin::check_handin(\%itemcount, 3807 => 1))) {#Vermiculated Armor
			
			quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
  }
#END of FILE Zone:poknowledge  ID:202239 -- Hierophant_Trilawyth 


