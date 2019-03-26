sub EVENT_SPAWN {
	my $count = 0;
	quest::settimer("train",7);
}

sub EVENT_TIMER {
	$count++;
	if($count==3) {
		quest::say("Listen up, recruits! Your lives will depend on your ability to deal with an enemy in unarmed combat.");
	}
	if($count==4) {
		quest::say("If you are comfortable in unarmed combat, you will be able to understand the worst cast scenario of any given situation.");
	}
	if($count==5) {
		quest::say("If you are caught by surprise, Your ability to fight with your feet and fists will be the base from which you will have to work.");
	}
	if($count==6) {
		quest::say("If that foundation is a strong one, you will have little to worry about... even in the most dire of situations.");
		quest::settimer("train",25);
	}
	if($count==7) {
		quest::say("Are you two ready to spar?");
		quest::signalwith(155131,1,5); # NPC: Recruit_Ulra
		quest::settimer("train",5);
	}
	if($count==8) {
		quest::signalwith(155131,2,5); # NPC: Recruit_Ulra
		quest::settimer("train",90);
	}
	if($count==9) {
		$count = 0;
		quest::settimer("train",7);
	}
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::say("Recruit, don't guess... Bring up your guard and fight! ");
	}
	if ($signal == 2) {
		quest::say("Good good! Ease up on him, Mogol. Both of you, take a break for a moment.");
	}
}
