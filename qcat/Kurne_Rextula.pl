# items: 17002, 10018, 12137, 12136
sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome to the new order of life, the life of service to our diseased Lord, Bertoxxulous. Did you encounter any of my [pets] on the way here? I hope not.");
	}
	elsif ($text=~/pets/i) {
		quest::say("My pets are the skeleton guardians of these catacombs. Some have been behaving erratically since the arrival of [Drosco].");
	}
	elsif ($text=~/drosco/i) {
		quest::say("Drosco used to be a loyal member of our shrine, until we learned the truth. The truth was that he was a mole from the Knights of Thunder. It appears they are assisting the Temple of Life in their pursuit of our eradication. Drosco was apprehended and boiled alive. I turned his boiled body into a zombie to march these halls. Now he must be stopped. He has begun to [compromise the shrine's location].");
	}
	elsif ($text=~/compromise/i) {
		quest::say("The problem is, he was strong in Karana's faith. And as sometimes is the case, there is a resonance from his deity. This causes him to wander in and out of our hidden shrine and I believe it also interferes with my control of the other pets. Please find him and destroy him. Bring me back the note I placed upon his body. Go!!");
	}
	elsif ($text=~/new task/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I have been working with a man named Lord Grimrot. We are attempting to raise an army of undead in the Plains of Karana. When the time is right, we shall attack from within as well as from beyond the walls of Qeynos. This army needs one more commander. I must find a Bloodsaber to [retrieve the commander]");
		}
		else {
			quest::say("While the Bloodsabers appreciate your past contributions to Bertoxxulous and our cause, we do not feel you can be trusted with vital information yet.");
		}
	}
	elsif ($text=~/retrieve the commander/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I have searched for the appropriate man... Sir Lucan of Freeport, Field Marshal Ralem, Marshal Anrey of Rivervale, even Commander Kane Bayle. Any of them would do, but they are either inaccessible or share a common goal with us. So I have decided Trumpy Irontoe is the one. Any former member of the [Irontoe Brigade] has a wealth of military strategies. Kill him and bring me his head. Kane will not be pleased, but, it must be done.");
		}
		else {
			quest::say("While the Bloodsabers appreciate your past contributions to Bertoxxulous and our cause, we do not feel you can be trusted with vital information yet.");
		}
	}
	elsif ($text=~/irontoe brigade/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("The Irontoe Brigade was a legendary military unit hailing from the dwarven city of Kaladim. After a dangerous assault, where more than three quarters of the unit met their bloody fate, the brigade disbanded and left for parts unknown. In Fish's Bar, in Qeynos, you can find one of them, Trumpy Irontoe.");
		}
		else {
			quest::say("While the Bloodsabers appreciate your past contributions to Bertoxxulous and our cause, we do not feel you can be trusted with vital information yet.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 18805 - Sealed Letter
	if (plugin::takeItems(18805 => 1)) {
		quest::say("Good work! You shall rise quickly in our ranks of evil. Let no man stand in your way and never betray the shrine or you to will join our collection of undead. You can also assist me with a [new task].");
		#:: Give a random reward: 17002 - Belt Pouch, 10018 - Hematite
		quest::summonitem(quest::ChooseRandom(17002, 10018)); # Item(s): Belt Pouch (17002)
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(221, 10);			#:: + Bloodsabers
		quest::faction(262, -1);			#:: - Guards of Qeynos
		quest::faction(296, 1);				#:: + Opal Darkbriar
		quest::faction(341, -1);			#:: - Priests of Life
		quest::faction(230, 1);				#:: + Corrupt Qeynos Guards
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 20 to 40cp
		my %cash = plugin::RandomCash(20,40);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 12136 - Dwarf Head
	elsif (plugin::takeItems(12136 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Incredible!! You have slain one of the greatest warriors in Qeynos!! He must have been full of grog. No doubt he drank most of his skill away. Now I shall cast a spell and strip the flesh from his skull and.. Presto!! Take this skull to Lord Grimrot somewhere in the Plains of Karana. He will be in the center of a field of skeletons. If he is not there, wait for his return. He must return eventually.");
			#:: Give a 12137 - Dwarf Skull
			quest::summonitem(12137); # Item: Dwarf Skull
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(221, 10);		#:: + Bloodsabers
			quest::faction(262, -1);		#:: - Guards of Qeynos
			quest::faction(296, 1);			#:: + Opal Darkbriar
			quest::faction(341, -2);		#:: - Priests of Life
			quest::faction(230, 1);			#:: + Corrupt Qeynos Guards
			#:: Grant a small amount of experience
			quest::exp(125);
			#:: Create a hash for storing cash - 50 to 70cp
			my %cash = plugin::RandomCash(50,70);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			quest::say("While the Bloodsabers appreciate your past contributions to Bertoxxulous and our cause, we do not feel you can be trusted with vital information yet.");
			#:: Return a 12136 - Dwarf Head
			quest::summonitem(12136); # Item: Dwarf Head
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
