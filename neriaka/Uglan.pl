sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Me Uglan. Mighty ogre. Member of Crakneks. We crush for dark elves. Do you [like dark elves] or they be [mean] to you?");
	}
	elsif ($text=~/like dark elves/i) {
		quest::say("Me love friends Dark Elves.");
	}
	elsif ($text=~/mean/i) {
		quest::say("You smart person. Me know Dark Elves are not friendly. They just use Ogres. Me not like Neriak anymore.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13357 - Cracked Stein
	if (plugin::takeItems(13357 => 1)) {
		#:: Match if the player is an Ogre
		if ($race eq "Ogre") {
			quest::say("You from Oggok. Me waiting for you. Me know dark elves have dark plan for ogres. We must stop plan. You must go to Nektulos Forest. Wait for blue orc. He deliver message for dark elf king. Not good. You kill blue orc runners. If message on them then you take to Lork in Oggok. Ogres must know plan.");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(239, 5);			#:: + The Dead
			quest::faction(303, 1);			#:: + Queen Cristanos Thex
			quest::faction(278, -1);		#:: - King Naythox Thex
			quest::faction(275, -1);		#:: - Keepers of the Art
			quest::faction(245, -1);		#:: - Eldritch Collective
			quest::faction(1522,-10);		#:: - Primordial Malice
			#:: Grant a small amount of experience
			quest::exp(500);
		}
		#:: Match if the player is any other race besides Ogre
		else {
			quest::say("Wat dis? Lork make deese steins. Dat means he tink you strong enuf for speshul quest me have for you. Me and Lork think ders something going on between dese darkies and the orcses in Crushbone. Someting bad for us Ogres. We need you to go mountains where da dorfs live. There be a blue orc runner wif darkie letters Lork wants. Bring Lork letters.");
			#:: Ding!
			quest::ding();
			#:: Set factions (Unconfirmed)
			quest::faction(228, 10);		#:: + Clurg
			quest::faction(232, 10);		#:: + Craknek Warriors
			quest::faction(261, -10);		#:: - Green Blood Knights
			#:: Grant a small amount of experience
			quest::exp(500);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
