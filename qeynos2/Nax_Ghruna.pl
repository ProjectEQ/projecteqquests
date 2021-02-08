sub EVENT_AGGRO {
	quest::say("That's it swine! You're outta here!");
}

sub EVENT_SAY {
	if ($text=~/stanos/i) {
		quest::say("Come over here, bub. Listen to me, and don't say a word. That name is one that can get you killed. Hanns wants Stanos dead, Renux wants to please Hanns, and everyone else wants to keep their spinal column intact, you know? So, $name, now you can speak. Where did you hear that name, or did you actually see Stanos somewhere?");
	}
}

sub EVENT_ITEM {
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}
