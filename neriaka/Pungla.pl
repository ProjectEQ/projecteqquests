# items: 13382
sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome! Drink you shall, some of de finest drinks of da lands! [Flaming Pungla] I suggest to you. It all me sells.");
	}
	elsif ($text=~/flaming pungla/i) {
		quest::say("Greatest drink and Plunga's creation. Buy one you should. Dey so gud me gots da charge t'ree golds.");
	}
}

sub EVENT_ITEM {
	#:: Match three gold
	if (plugin::takeCoin(0, 0, 3, 0)) {
		quest::say("Bottoms up!!");
		#:: Give a 13382 - Flaming Pungla
		quest::summonitem(13382); # Item: Flaming Pungla
		#:: Ding!
		quest::ding();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
