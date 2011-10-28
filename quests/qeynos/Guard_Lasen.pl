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
if ($text=~/hail/i) {
  quest::say("I wish it wasn't so blasted hot, I could really use some water.");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 13006 => 1)) {
  if ($text=~/Thank you, that was very kind.  Here take this for your trouble./i) {
    quest::faction( 9, 5);
    quest::faction( 135, 5);
    quest::faction( 217, 5);
    quest::faction( 33, -10);
    quest::faction( 53, -10);
    quest::givecash(5,0,0,0);
  }
}
}