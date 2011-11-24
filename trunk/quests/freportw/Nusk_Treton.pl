############################################
# ZONE: West Freeport (freportw)
# QUEST: Journal Lockbox
# DEVELOPER: MWMDRAGON
# REVISED:  robregen
############################################

sub EVENT_SAY { 
	if($text=~/Hail/i) {
		quest::say("Freeport!!  Great trade city of Norrath!!  What a wondrous place!  How do you do?  You are an [arcane scientist]. are you not?");
	}
	if(($text=~/arcane scientist/i) && ($faction < 5)) {
		quest::say("Grand!! I remember my younger days within this great academy. I have spent many years of research here in Freeport. I compiled a [locked journal] of my research. Alas, I am still awaiting its return.");
	}
	if(($text=~/locked journal/i) && ($faction < 5)) {
		quest::say("I lent it to an old colleague of mine in Ak'Anon. He was to send it back aboard a private vessel. One Lenka Stoutheart was to return it to me. It has already been one month and counting. I wish there was a young wizard who could [seek out Lenka]. ");
	}
	if(($text=~/seek out Lenka/i) && ($faction < 5)) {
		quest::say("What luck!! I would be most appreciative if you could find Lenka Stoutheart in Freeport and inquire where the journal strongbox might be. I do so look forward to its return.");
	}
	if((($text=~/arcane scientist/i) || ($text=~/locked journal/i) || ($text=~/seek out Lenka/i)) && ($faction == 5)) {
		quest::say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us.  Perform a tasks for the great Tara Neklene.");
	}
	if((($text=~/arcane scientist/i) || ($text=~/locked journal/i) || ($text=~/seek out Lenka/i)) && ($faction > 5)) {
		quest::say("You had best leave my sight.  I am a faithful member of the Academy of Arcane Science and you are no ally of ours.");
	}
}


sub EVENT_ITEM {
	if($faction < 5) {
		if(plugin::check_handin(\%itemcount, 13860 => 1)) { # A Strongbox ID-13860
			quest::say("Grand and fantastic!! You have made my day complete. Here is what little I can offer. Most of my money goes into my research. Thank you. ");
			quest::ding();
			quest::exp("100");
			quest::faction("11","3");# Faction Arcane Scientists ID-11
			quest::faction("184","3");# Faction Knights of Truth ID-184
			quest::faction("235","-3");# Faction Opal Dark Briar ID-235
			quest::faction("105","-3");# Faction Freeport Militia ID-105
			quest::givecash("2","10","0","0");
		}
	}
	plugin::return_items(\%itemcount);
	quest::say("I have no need for this $name, you can have it back.");
}

#END of FILE Zone:freportw  ID:9063 -- Nusk_Treton