sub EVENT_SPAWN {
	quest::settimer(2,45);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Here's something from one of our more unusual crops, see what you think.");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84090,84090,84090,84090,84090,84090,84090));
                quest::updatetaskactivity(220,8);
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}