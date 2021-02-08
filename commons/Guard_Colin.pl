sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail traveler. By order of Sir Lucan, the toll fee is one gold piece a head. Pay at once!!");
	}
}

sub EVENT_ITEM {
	#:: Match one gold piece
	if (plugin::takeCoin(0, 0, 1, 0)) {
		quest::say("It is best you donate to the Freeport Militia. I would hate to see something happen to you.");
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
