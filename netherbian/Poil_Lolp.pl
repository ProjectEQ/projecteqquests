# items: 84091, 84092, 84093, 84082
sub EVENT_SPAWN {
	quest::settimer(2,600);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Brave of you to have come back into the dark cave. Braver still if you try this treat...");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84082,84082,84082,84082,84082,84082)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093), Lollipop (84082), Lollipop (84082), Lollipop (84082), Lollipop (84082), Lollipop (84082), Lollipop (84082)
                quest::updatetaskactivity(500220,7);
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}
