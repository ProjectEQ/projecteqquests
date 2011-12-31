sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. adventurer!  Stay close to the gates or risk your life.  The Lake of Ill Omen is aptly named."); }
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


#END of FILE Zone:lakeofillomen  ID:5113 -- Trooper_Hegwez 

