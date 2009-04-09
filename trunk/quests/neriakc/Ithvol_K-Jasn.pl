#Ithvol K-Jasn.pl
#Innoruuk Disciple/Innoruuk Regent

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Hail, $name! I sense the gift of hatred in your aura. What status do you hold within these Spires?");
	}
	if($text=~/initiate of Innoruuk/i){
		quest::say("Well met, Initiate $name. If you desire to raise your station in this temple, I have a task for you. Are you willing to accept the task I am about to set before you?");
	}
	if($text=~/willing/i){
		quest::say("As an initiate of the Spires, you have proven your hatred of the halflings who are desecrating our forest with their feeble shrines and camps. They persist in their hopeless task and seem to anticipate many of our tactics against them. Go out into the Nektulos and slay the one called Master Whoopal. Take his head to Draxiz N'Ryt so that he may probe the brain.");
	}
	if($text=~/deliver the provisions/i){
		quest::say("Very well.  Go to the Neriak Foreign Quarter and tell Dran `slug` Rembor that I sent you.");#text made up
	}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 12497 => 1, 1369 => 1)){#Head of a Halfling Spy, Initiate Symbol of Innoruuk
		quest::emote("You have focused the hate within you and discovered that hate and rage are not the same. Hate can be calculating and deceptive. For your service in defending the Kingdom of King Naythox Thex from the halfling invaders, I award you the disciple symbol of Innoruuk. Wear it with pride, $name.");
		quest::summonitem(1370);#Disciple Symbol of Innoruuk
		quest::exp(4000);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
		quest::faction(260, -30);#Primordial Malice
	}
	elsif(plugin::check_handin(\%itemcount, 12499 => 1, 1369 => 1, 19029 => 1, 1370 => 1)){#Voucher of Service to Naythox, Swiftmoon's Head, Receipt for Provisions Crate, Disciple Symbol of Innoruuk
		quest::emote("I award you the regent symbol of Innoruuk. Wear it with pride, $name.");#text borrowed from previous in series and altered.
		quest::summonitem(1371);#Regent Symbol of Innoruuk
		quest::exp(8000);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
		quest::faction(260, -30);#Primordial Malice
	}
	else {
  	quest::say("I don't need this.");#text made up
  	plugin::return_items(\%itemcount);
	}
}#Done