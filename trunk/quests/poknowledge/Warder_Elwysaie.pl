#Warder_Elwysaie.pl
#Ranger Tomes/Planar Armor Exchange
#Added tome turn-ins -Kilelen

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("closes her eyes and gives a nod of respect to $name. 'Welcome to the district of Tanaan. You will find the cornerstone of neutrality and balance within the whole of the known universe resides in the hearts, spirits, and minds of Tanaan's citizens. We accept all in our midst, should they choose not to disrupt what we have striven for countless eras to create and preserve with the speeches of the zealous. Both crusaders of light and shadow threaten our ways, though we do not hold a true disdain toward either. We are the true soldiers of balance -- that which you do not even realize you strive for in your valiant causes. Understand that light will pit against light should it overrun the primal universe, and likewise shall shadow consume shadow. We of Tanaan embrace this philosophy and live by its code most fiercely. If you are unable to yield to this path during your visit of us, then I would humbly suggest that you seek the district of Selia where the other soldiers of the light dwell.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4891 => 1)) ||
		(plugin::check_handin(\%itemcount, 4892 => 1)) ||
		(plugin::check_handin(\%itemcount, 4893 => 1)) ||
		(plugin::check_handin(\%itemcount, 4894 => 1)) ||
		(plugin::check_handin(\%itemcount, 4895 => 1)) ||
		(plugin::check_handin(\%itemcount, 4896 => 1)) ||
		(plugin::check_handin(\%itemcount, 4897 => 1))) {#Thorny Vine Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  else {
		plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
		plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:poknowledge  ID:202006 -- Warder_Elwysaie 