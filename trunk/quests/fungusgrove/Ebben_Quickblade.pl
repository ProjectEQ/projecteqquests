sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("What ya want? You wouldn't be one of them Talikars come lookin for who robbed your gran daddys grave would ya? Hahaha. Get lost!"); 
	}
}

sub EVENT_AGGRO {
	quest::say("So you want a taste of my blades eh? Lets dance!");
}

sub EVENT_DEATH {
	quest::say("You had best watch your backs fools! My companions Rolktim and Missy shall avenge my death!!");
}

#END of FILE Zone:fungusgrove  ID:157047 -- Ebben_Quickblade 

