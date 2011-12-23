sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::say("Fear the blades of the Iksar!!");
	}
	if($combat_state == 0) {
		quest::emote("hisses, 'To victory!!'");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is assumed that the froglok stronghold is well defended. None of the troopers sent from this garrison to find it have ever returned.  At least. not in one piece."); }
}
#END of FILE Zone:swampofnohope  ID:83066 -- Trooper_Lorgen 

