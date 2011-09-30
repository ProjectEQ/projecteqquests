sub EVENT_COMBAT {
	if($combat_state == 1) {
	quest::say("Time to die!");
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail! My name is Perin. If you had any smarts at all you would be careful who you talk to around here."); }
}
#END of FILE Zone:qeynos  ID:1164 -- Guard_Perin 

