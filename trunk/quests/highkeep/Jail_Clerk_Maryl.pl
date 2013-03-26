sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Hail! I am the jail clerk of Highkeep. How may I be of service?");
	}
	if($text=~/highpass lottery/i) {
		quest::say("The Highpass Lottery is held every season.  The Casino Treasurer, Lynn, handles all ticket sales and information.  She can be found at the vault.");
	}  
	if($text=~/fenn kaedrick/i) {
		quest::say("Why do you ask of that horrid rogue? We had him locked away with that high elf and then he got bailed out. I know of no reason why anyone would want to bail his bloody carcass out of our dungeon.");
	}
}

sub EVENT_ITEM {
	plugin::return_items(\%itemcount);
}


#END of FILE Zone:highkeep  ID:6058 -- Jail_Clerk_Maryl