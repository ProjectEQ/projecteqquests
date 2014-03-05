# Arena Mob

my $setH;

sub EVENT_SPAWN { 
	$setH = $h;
	quest::settimer("melee",9);
}

sub EVENT_TIMER {
	if($timer eq "melee") {
		#random melee animations
		quest::doanim(quest::ChooseRandom(1,2,5,6,8,84,85));
	} elsif ($timer eq "reset") {
		quest::stoptimer("reset");
		DO_ANIM();
	}
}

sub EVENT_SIGNAL {
	if($signal == 297209) {
		#aggro runt assist
		quest::stoptimer(1);
		quest::modifynpcstat("special_attacks","SMCD");
	} elsif($signal == 297034) {
		#arena stops fighting and looks at those that entered
		if($y >= 0) {
			$npc->GMMove($x,$y,$z,$npc->CalculateHeadingToTarget(60,0));
		} elsif ($y <= 0) {
			$npc->GMMove($x,$y,$z,$npc->CalculateHeadingToTarget(60,0));
		}
		quest::stoptimer("melee");
		quest::settimer("reset",3600);
	}
}

sub EVENT_COMBAT {
	if($combat_state == 0) {
		quest::stoptimer("reset");
		DO_ANIM();
	}
}

sub DO_ANIM {
	quest::modifynpcstat("special_attacks","ABfHG"); #go inactive
	$npc->GMMove($x,$y,$z,$setH);
	quest::settimer("melee",9);
}