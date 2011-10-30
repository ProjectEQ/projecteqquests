sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Hail.. Prime.. Healer!!");
	}
}

sub EVENT_DEATH {
	quest::say("Temple.. Life.. Get you!!  Yes..");
}

sub EVENT_SAY { 
	if($text=~/Hail/i) {
		quest::say("Follow path of life. Rodcet Nife is only true way."); 
	}
}

#END of FILE Zone:southkarana  ID:14048 -- Brother_Drash 

