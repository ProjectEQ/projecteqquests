# items: 84091, 84092, 84093, 84085
sub EVENT_SPAWN {
	quest::settimer(2,300);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Gimme gimme gimme. . .You people make me sick! Here's your nasty little treat, now leave me be.");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84085,84085,84085,84085,84085,84085)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093), Candy Jack-o-Lantern (84085), Candy Jack-o-Lantern (84085), Candy Jack-o-Lantern (84085), Candy Jack-o-Lantern (84085), Candy Jack-o-Lantern (84085), Candy Jack-o-Lantern (84085)
                quest::updatetaskactivity(500220,0);
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}