sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Have you tried to drink from the lake?  It is poisoned with salt!  If you plan on venturing to the far side of the lake. you had best visit one of the Kloks to purchase a Water Extractor."); }
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


#END of FILE Zone:lakeofillomen  ID:5096 -- Trooper_Curlish 

