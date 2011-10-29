sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("AARRGHHH!!!!!  Into the fray come the Wolves of the North.  Cut you down, I will!!");
	}
}

sub EVENT_DEATH {
	quest::say("You fool!!  My brothers and sisters of the Wolves of the North shall hunt you down!  You.. are.. through..");
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the village of McMannus. We sell many goods. Feel free to look around - just keep your hands to yourself. Good day.");
}
if($text=~/murderer/i){
quest::say("Aye. I have heard 'bout the murderer. Clan McMannus has the best hunting dogs in the land. The one over there named Frostbite is one of the best. If you have a piece of sweaty clothing, he can track the person no matter how far away they are."); }
}
#END of FILE Zone:qey2hh1  ID:5187 -- Ulrich_McMannus 

