sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 1) {
    $npc->SetAppearance(3);
	}
	if($wp == 21) {
    quest::emote("grabs a large chunk of raw owlbear meat from the storeroom.");
	}
	if($wp == 35) {
    quest::say("hail Palav. It's feeding time my friend. Now now Rajyk, It's ladies first. I will return with your food shortly.");
	quest::signal(155289,1); # NPC: Palav
	quest::signal(155288,1); # NPC: Rajyk
	}
	if($wp == 47) {
    quest::emote("grabs a large chunk of raw owlbear meat from the storeroom.");
	}
	if($wp == 59) {
    quest::say("hail Rajyk. You didn't think I forgot to feed you did you? Eat well my friends, I will be back again.");
	quest::signal(155289,1); # NPC: Palav
	quest::signal(155288,1); # NPC: Rajyk
	}
	if($wp == 67) {
    quest::say("My my, what a selection. I think I'll go with some ale today.");
	}
	if($wp == 78) {
    $npc->SetAppearance(1);
	}
}



sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. friend.  May I be of assistance?"); }
}
#END of FILE Zone:sharvahl  ID:155172 -- Warder_Keeper_Jyk 

