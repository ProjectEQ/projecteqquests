# items: 54026
my $count = 0;

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Guards! Guards!");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 10
	if ($wp == 10) {
		quest::say("Yoohoo!");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello there. sweetie!!  How about letting me dance for you?  Two gold and I will do a little dance for you.");
	}
	elsif ($text=~/tayla/i) {
		quest::say("Why do you seek that little scamp when you have Mare right here? If you really want to know where she is, it will cost you. Did I ever tell you that my heart belongs to Jasper?");
	}
}

sub EVENT_ITEM {
	#:: Match a 10020 - Jasper
	if (plugin::takeItems(10020 => 1)) {
		quest::say("Jasper! My one and only love! All right.. That Tayla creature was lost in a game of King's Court with a very important and secret merchant. Belyea will not speak of him but that he was some sort of Baron. He did give me this trinket from his new friend and owner of the half-elf scamp. You keep it. It is worth nothing compared to sweet, beautiful Jasper.");
		#:: Give a 54026 - Klok's Seal
		quest::summonitem(54026); # Item: Klok's Seal
	}
	#:: Match two gold pieces
	elsif (plugin::takeCoin(0, 0, 2, 0)) {
		quest::say("Oooh yes!! I just love a patron with an over abundance of gold.");
		#:: Set a timer 'dance' that triggers every 3 seconds
		quest::settimer("dance", 3);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_TIMER {
	#:: Match timer 'dance'
	if ($timer eq "dance") {
		#:: Increment the counter
		$count++;
		if ($count < 5) {
			#:: Do some dance moves
			quest::doanim(quest::ChooseRandom(28, 36, 40, 42, 51, 52, 53, 58, 60, 62, 64, 70));
		}
		else {
			#:: Stop timer
			quest::stoptimer("dance");
			#:: Reset the count
			$count = 0;
		}
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("The death of a Dark Bargainer never goes unnoticed!");
}
