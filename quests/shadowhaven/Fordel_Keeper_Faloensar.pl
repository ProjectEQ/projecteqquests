sub EVENT_SIGNAL {
	if ($signal==1) {
	quest::say("Pleasant as always Verte. So what can I do for you today?");
	}
	if ($signal==2) {
	quest::say("Ah I see, very well then here is your receipt. Good luck with the cleanup and keep those Dwarves in line!");
	}
	if ($signal==3) {
	quest::say("Ok see you later Verte!");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name. how can I help you today?"); }
}
#END of FILE Zone:shadowhaven  ID:150286 -- Fordel_Keeper_Faloensar 

