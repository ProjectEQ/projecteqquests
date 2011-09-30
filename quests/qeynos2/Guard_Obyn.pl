sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there. $name.  Obyn is my name.  Are you from Qeynos?  I was born here myself.  It's the best city in all of Norrath. if you ask me.  Well I'd better get back to guarding."); }
}
#END of FILE Zone:qeynos2  ID:2334 -- Guard_Obyn 

