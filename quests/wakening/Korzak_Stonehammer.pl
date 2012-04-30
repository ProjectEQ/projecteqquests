# The Supply Run
# author - robregen
# date - 4/10/12

sub EVENT_SAY { 
	if(($text=~/missing helmet/i) && ($faction < 6)) { 
		quest::say("Recently helmets have been stolen from our workers.  One of them reported seeing one of those wreched flying monkey beasts carry one off.  Having those helmets back would be very useful.  If you come across any of the workers helmets, return them to me and I will bestow a reward totem upon you.");
	} 	 # may be broken, incomplete or unknown beyond this point.  no helmets has drops from any holgresh mobs in the zone according to magelo.com and zam.
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 25266 =>1)) { # Giant Sack of Supplies
		quest::say("It's about time the supplies got here.  Not like it's a long trip from the center of Kael to us out here.  Payment?  I already paid Wenglawks for the supplies I ordered.  Don't give me any trouble, little one.  I have enough trouble with the missing helmets.");
		quest::ding();
		quest::faction(189,10); # Kromzek
		quest::faction(188,10); # Kromrif
		quest::faction(49,-30); # Coldain
		quest::faction(42,-30); # Claws of Veeshan
		quest::exp(250);
	}
	plugin::return_items(\%itemcount);
}



