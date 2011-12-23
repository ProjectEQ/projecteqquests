sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::say("Fear the blades of the Iksar!!");
	}
	if($combat_state == 0) {
		quest::emote("Another victory for the Legion of Cabilis!!");
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. adventurer!  Watch your step and don't get lost in the swamplands.  The frogloks will have you for stew."); }
}
#END of FILE Zone:swampofnohope  ID:83061 -- Trooper_Fodcod 

