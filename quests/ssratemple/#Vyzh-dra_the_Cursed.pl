#Cursed Event - SsraTemple#This is one of the raid NPC's that must be killed during the event. There is two versions of two of the named during the cycle. #If a previous raid failed to complete the entire event, but managed to kill some of the named during the event, the next attempt will get lootless palceholders.#This prevents a group from farming begining NPC's for loot. The PH's have the exact same stats and skills, just no loot. The real version for the first NPC is #a_glyphed_covered_serpent#and it's lootless PH is #a_rune_covered_serpent. The second NPC's real version is #Vyzh'dra the Exiled with a lootless pH of #Vyzh'Dra the Banished. The final NPC, #Vyzh'dra the Cursed has no lootless PH as killing him completes the event for 5 days.## Written by Reno#
sub EVENT_SLAY {	#This is flavor text from live for whenever a player dies.
	quest::shout("Tell your gods that I will be coming for them next!");
}

sub EVENT_DEATH {	#Flavor text from live
	quest::shout("I cannot die! I am the only true god!");	#Flavor text from live
	quest::emote("crashes to the ground. A horrific sound fills the room, but vanishes as quickly as it came.");	#Signal the cursed controller that we have died
	quest::signalwith(162255,3,0);
}
