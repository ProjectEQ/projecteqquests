sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("Prepare to die, infidel!!");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name! Be careful out in Toxxulia Forest! There are many venomous creatures out here. If things get too scary for you. run back to us and we shall take care of the threat."); }
}
#END of FILE Zone:tox  ID:38124 -- Sentinel_Drom 

