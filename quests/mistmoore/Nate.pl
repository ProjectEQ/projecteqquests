sub EVENT_SPAWN {
	quest::settimer(2,45);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Well, it's not ale but you'll just have to deal with that. . .By the by did you happen to bring any ale with you?");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84083,84083,84083,84083,84083,84083));
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}