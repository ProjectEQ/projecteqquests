# items: 13130
sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Do you know who I am?!! I am the Commander of the Qeynos Guard!! Do you think I trod through these sewers to speak with you? If so then you are quite mistaken.");
	}
	elsif ($text=~/bloodsabers/i) {
		quest::say("I have heard whispers of such a group. I believe the Priests of Life spoke the name once. No.. I think it was the Knights of Thunder. Bah!! I cannot remember.");
	}
	elsif ($text=~/priests of life/i) {
		quest::say("The awe inspiring Temple of Life in North Qeynos is home to the paladins and clerics called the Priest of Life. This temple draws many visitors from far and wide. The resident healer of Qeynos is a member of this temple. They have been assisting us with the extermination of the recent rise of rabid animals within Qeynos Hills.");
	}
	elsif ($text=~/knights of thunder/i) {
		quest::say("The paladins and clerics of the Knights of Thunder are well respected within this city. They often assist the Qeynos Tower Guards in the Plains of Karana. Their grounds are located to the side of the arena and past a few homes.");
	}
	elsif ($text=~/nerissa/i) {
		quest::say("You keep you eyes off that sweet innocent girl. She is under my care.");
	}
	elsif ($text=~/milea/i) {
		quest::say("Milea Clothspinner is an old flame of mine. She would have made a fine wife. Unfortunately for me, she chose to become a fine warrior.");
	}
	elsif ($text=~/antonius bayle/i) {
		quest::say("How dare you speak the name of Antonius Bayle around me!! Brother he may be, but ruler he is not. We could not possibly have been sired by the same person. The empire of Qeynos would stretch as far to Freeport if I were in control. Emperor Kane.. I like the sound of that.");
	}
	elsif ($text=~/disease is spreading/i) {
		quest::say("Good to see you, my friend. S'ragg said he would be sending his finest. I pray he is right. Do you feel like [going to Highpass] or [going home]?");
	}
	elsif ($text=~/highpass/i) {
		quest::say("You will be taking this with you. Give this marked bottle to a man called Barn Bloodstone. He is known to hang around a place called the Golden Rooster. He has a package for me. He will then give you instructions to your next destination. Now, be off! Time is of the essence!");
		#:: Give a 13130 - Blackburrow Stout
		quest::summonitem(13130); # Item: Blackburrow Stout
	}
	elsif ($text=~/home/i) {
		quest::say("Just as well.  Get the shrine to send me someone of strength.  No more cowards!");
	}
}


sub EVENT_ITEM {
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	#:: Return unused items
	plugin::returnUnusedItems();
}
