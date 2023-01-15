# items: 16165
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
quest::faction(263, 5); # Faction: Guardians of the Vale
quest::faction(286, 5); # Faction: Mayor Gubbin
quest::faction(355, 5); # Faction: Storm Reapers
quest::faction(292, 5); # Faction: Merchants of Rivervale
quest::faction(334, -10); # Faction: Dreadguard Outer
quest::givecash(0,0,1,0);
quest::exp(500);
}
  }
