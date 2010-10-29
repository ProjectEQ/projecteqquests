sub EVENT_SPAWN {
	quest::settimer(2,45);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Careful with these, or they'll get stuck in your teeth!");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84086,84086,84086,84086,84086,84086));
                quest::updatetaskactivity(220,5);
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}