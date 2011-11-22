sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 1) {
	plugin::DoAnim("wave");
	}
}


sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}
