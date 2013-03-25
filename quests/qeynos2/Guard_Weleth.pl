#Guard_Weleth.pl
#The Crate (evil) and The Crate (good)

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 8) {
    quest::say("Argh. Not again. This whole crate needs to be returned!");
  }
}

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Hail, $name. My name is Weleth Nagoh. In addition to my patrol, I am in charge of keeping the guardhouse stocked with supplies. I must get back to my duties. Farewell.");
	}
	
	if($text=~/crate/i)   {
		quest::say("Oh, we just received a shipment of arrows from [Nesiff] in South Qeynos. The arrows in this box are missing their fletchings and I can't leave my patrol to take them back.");
	}
	
	if($text=~/Nesiff/i)   {
		quest::say("Nesiff Tallaherd owns the wooden weapons shop in Merchant's Square in South Qeynos.");
	}
	
	if($text=~/arrows/i)   {
		quest::say("Oh, thank you! Here is the crate. Make sure [Nesiff] sends me back a new invoice. [Lieutenant Dagarok] would have my head if he found out this happened again!");
		quest::summonitem(13925);#Crate of Defective Arrows
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18824 => 1)) { #Slip of Parchment
		quest::say("Thank you so much for the favor. Please be careful here in Qeynos. I have come to suspect that even some of my fellow guards are not to be trusted - Lieutenant Dagarok, for one.");
		quest::faction(135, 10);#Guards of Qeynos
		quest::faction(9, 10);#Antonius Bayle
		quest::faction(33, -20);#Circle Of Unseen Hands
		quest::faction(53, -20);#Corrupt Qeynos Guards
		quest::faction(217, 10);#Merchants of Qeynos
		quest::exp(8000);
		my $cp = int(rand(8));
		quest::givecash($cp, 0, 0, 0);
	}
	plugin::return_items(\%itemcount);
}

#End of File zone:qeynos2 ID: 2079 -- Guard_Weleth.pl