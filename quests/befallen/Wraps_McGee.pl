sub EVENT_SPAWN {
	quest::settimer(2,45);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Here I'll just wrap this up for you. . . Get it? Hahaha!");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,6800,6800,6800,6800,6800,6800,6800));
                quest::updatetaskactivity(220,9);
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}