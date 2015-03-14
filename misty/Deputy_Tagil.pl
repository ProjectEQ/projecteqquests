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
if($itemcount{18013} == 1){
quest::say("What's this?  Oh dear.  I am very sorry.  Please take this to Uner with my apologies.");
quest::summonitem(13240); }
}

#End of File, Zone:misty  NPC:33090 -- Deputy_Tagil