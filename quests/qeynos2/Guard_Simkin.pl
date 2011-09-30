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
quest::say("Heh?  $name. huh?  What do you want?  Can't you see I am a busy man. guarding and protecting you weaklings..  er.. citizens?  You better just move along before something happens to you!"); }
}
#END of FILE Zone:qeynos2  ID:2389 -- Guard_Simkin 

