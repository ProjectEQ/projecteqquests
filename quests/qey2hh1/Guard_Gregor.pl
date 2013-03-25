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
  if(($ulevel >= 20) && ($ulevel <= 30)) {
    if($text=~/hail/i) {
      quest::say("Oh, hello $name. Would you like to assist me in a [task]?");
    }
    if($text=~/task/i) {
      quest::say("Excellent! I was hoping you would be able to help me.");
      quest::taskselector(143); #Task: Bringing Goods to the Karanas
    }
  }
  else {
    quest::say("Sorry, $name. I am quite busy...");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
