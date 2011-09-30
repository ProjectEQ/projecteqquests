sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. $name.  I am Holly Windstalker. Protector of the Pine.  What brings you out to the Qeynos Hills?  Not hunting. I hope. These stains on my blade are all that is left of the last adventurer I caught harming my bear and wolf friends."); }
}

sub EVENT_COMBAT {
	if($combat_state == 1){
	quest::say("Natural selection at work.");
	}
}


sub EVENT_AGGRO {
   quest::say("Natural selection at work.");
}

#END of FILE Zone:qeytoqrg  ID:4082 -- Holly_Windstalker 

