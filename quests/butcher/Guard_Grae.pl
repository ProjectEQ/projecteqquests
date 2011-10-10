#npc - Butcher Guard Protectors
#zone - Butcher
#by Angelox

sub EVENT_COMBAT {
    if($combat_state == 1) {
    quest::say("For the glory of Kaladim, have at thee!!");
	}
	if($combat_state == 0) {
    quest::say("For the glory of Kaladim!! You are no more.");
	}
}

#END of FILE Zone:butcher  ID:68064 -- Glorin_Binfurr 

