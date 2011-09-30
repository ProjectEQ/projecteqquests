sub EVENT_SPAWN {
	quest::settimer(2,500);
	quest::settimer(3,505);
	quest::settimer(4,510);
	quest::settimer(5,515);
	quest::settimer(6,540);
	quest::settimer(7,545);
}

sub EVENT_TIMER {
		if($timer==2) {
		quest::say("Listen up, recruits! Your lives will depend on your ability to deal with an enemy in unarmed combat.");
		quest::stoptimer(2);
		}
		if($timer==3) {
		quest::say("If you are comfortable in unarmed combat, you will be able to understand the worst cast scenario of any given situation.");
		quest::stoptimer(3);
		}
		if($timer==4) {
		quest::say("If you are caught by surprise, Your ability to fight with your feet and fists will be the base from which you will have to work.");
		quest::stoptimer(4);
		}
		if($timer==5) {
		quest::say("If that foundation is a strong one, you will have little to worry about... even in the most dire of situations.");
		quest::stoptimer(5);
		}
		if($timer==6) {
		quest::say("Are you two ready to spar?");
		quest::signalwith(155131,1,5);
		quest::stoptimer(6);
		}
		if($timer==7) {
		quest::settimer(2,500);
		quest::settimer(3,505);
		quest::settimer(4,510);
		quest::settimer(5,515);
		quest::settimer(6,540);
		}
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
	quest::say("Recruit, don't guess... Bring up your guard and fight! ");
	quest::signalwith(155131,2,5);
	}
	if ($signal == 2) {
	quest::say("Good good! Ease up on him, Mogol. Both of you, take a break for a moment.");
	}
}
