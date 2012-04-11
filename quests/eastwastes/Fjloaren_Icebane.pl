# The Supply Run
# author - robregen
# date - 4/10/12

sub EVENT_SAY { 
	if(($text=~/hail/i) && ($faction < 6)) { 
		quest::say("What is it you want, $race?  I have no time to speak with your kind.");
	} 
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 25266 =>1)) { # Giant Sack of Supplies
		quest::say("Thank you for bringing the supplies, $name. This season has not treated my clan well.  The winds have grown colder and the Coldain are now brazen enough to hunt the same animals we do.  Take this torque back to Svekk and he will repay you for the supplies.");
		quest::ding();
		quest::faction(189,10); # Kromzek
		quest::faction(188,10); # Kromrif
		quest::faction(49,-30); # Coldain
		quest::faction(42,-30); # Claws of Veeshan
		quest::exp(250);
		quest::summonitem(25278); # Velium Torque
	}
	plugin::return_items(\%itemcount);
}

