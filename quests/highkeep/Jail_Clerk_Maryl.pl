sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Hail! I am the jail clerk of Highkeep. How may I be of service?");
	}
   elsif ($text=~/highpass lottery/i) {
      quest::say("The Highpass Lottery is held every season.  The Casino Treasurer, Lynn, handles all ticket sales and information.  She can be found at the vault.");
   } 
   elsif ($text=~/fenn kaedrick/i) {
      quest::say("Why do you ask of that horrid rogue? We had him locked away with that high elf and then he got bailed out. I know of no reason why anyone would want to bail his bloody carcass out of our dungeon.");
   }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 18935 => 1)) { # Sealed Note
      quest::say("That little halfing has escaped our prison. No doubt he will travel back to the safety of Rivervale. He left this cracked emerald. It appears he must have broken off a piece of it. I believe it belongs in Kaladim. You may take it, but I am sure your master will not be satisfied until you combine the final piece with this one. Of course, first you will have to find Bronin and ask him of the missing emerald shard.");
      quest::exp(1000);
      quest::summonitem(17927); # Cracked Emerald
   }

   plugin::return_items(\%itemcount);
}

#END of FILE Zone:highkeep  ID:6058 -- Jail_Clerk_Maryl
