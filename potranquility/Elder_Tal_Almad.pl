#Edit on April 19, 2007 for Tome of Dark Power quest - Kilelen
sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Welcome traveler. are you here to meet with someone or are you new to this place?");
	}

	if($text=~/i am new to this place/i){
		quest::say("Please take some time to look around. but be sure to speak with one of my fellow Elders prior to tampering with anything that may resemble a magical portal.  Tampering with the wrong object or in the wrong location on this island may take you to a very different and dangerous plane of existence.");
	}

	if($text=~/i am here to meet with someone/i){
		quest::say("Well then, if you do not need my assistance, I will continue my work. May you find that which you seek.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 28741 => 1)){#Locked Tome of Dark Power
		quest::emote("looks the book over carefully, 'This is a most interesting find indeed. You seek to break the seal that surrounds this tome? This may take some time, please be patient.' As he waves his hand over the lock and mumbles a few syllables, the clasp instantly falls open. With a surprised look he says, 'That was odd, the seal was easier to break then I thought it would be. It's almost. . . Well, it's almost as if the book had a will to be opened. I sense much power inside this tome, you best be careful with it.' He hands the book back to you.");
		quest::summonitem(28742);#Unlocked Tome of Dark Power
	}

}#END of FILE Zone:potranquility  ID:203054 -- Elder_Tal_Almad 