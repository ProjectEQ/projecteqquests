# items: 18013, 13240
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
  if(plugin::check_handin(\%itemcount, 18013 => 1)){
    quest::say("What's this? Oh dear. I am very sorry. Please take this to Uner with my apologies.");
    quest::summonitem(13240); # Item: Deputy Tagil's Payment
  }
  plugin::return_items(\%itemcount);
}

#End of File, Zone:misty  NPC:33090 -- Deputy_Tagil