sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount,16165=> 1)){
quest::say("Daleen sent you? She is so sweet. If she wasn't married.. ehem.. Thanks.");
quest::faction(133, 5);
quest::faction(208, 5);
quest::faction(316, 5);
quest::faction(218, 5);
quest::faction(88, -10);
quest::givecash(0,0,1,0);
quest::exp(500);
}
  }