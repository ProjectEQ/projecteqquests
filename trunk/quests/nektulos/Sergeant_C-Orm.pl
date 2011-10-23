sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
	if($combat_state == 0){
		quest::say("Hardly a worthy adversary.  A member of the Indigo Brotherhood deserves a much better opponent.");
	}
}

sub EVENT_AGGRO {
	my $random = int(rand(3));
	if($random == 0) {
		quest::say("$class like you are an affront to my senses!");
	}
	if($random == 1) {
		quest::say("$class like you always bring out the worst in me!");
	}
	if($random == 2) {
		quest::say("It's $class like you that insult all of Norrath!");
	}
}
