sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I've heard rumors of disappearing fishermen on the Lake of Ill Omen. Strange sightings abound. If I were you. I'd do my best to avoid those waters."); }
}

sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Fear the blades of the Iksar!!");
	}
	if($combat_state==0) {
		quest::say("Another victory for the Legion of Cabilis.");
	}
}

sub EVENT_DEATH {
	quest::say("You have not won.  Consider yourself wanted by the Legion of Cabilis.");
}


#END of FILE Zone:lakeofillomen  ID:5098 -- Trooper_Digdul 

