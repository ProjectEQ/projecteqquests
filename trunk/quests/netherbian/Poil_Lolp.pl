sub EVENT_SPAWN {
	quest::settimer(2,45);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Brave of you to have come back into the dark cave. Braver still if you try this treat...");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84082,84082,84082,84082,84082,84082));
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}