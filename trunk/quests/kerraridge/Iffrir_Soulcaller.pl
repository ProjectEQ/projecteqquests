sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Rrr!  Kejaan guide my claws!  You disturrrb our peace no more!");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hrrrm..  Iffrir does not much care for smell of this place but the selling of good drinks is not permitted within the inner village so any priestess must come here for them."); }
}
#END of FILE Zone:kerraridge  ID:74084 -- Iffrir_Soulcaller 

