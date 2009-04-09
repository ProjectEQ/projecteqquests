sub EVENT_SPAWN {
	quest::settimer(2,45);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Why is it that you people keep pestering me for these? Here's your treat, now tell everyone else they can find me off under the ocean or some nonsense.");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84084,84084,84084,84084,84084,84084,84084));
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}