# items: 5013, 5016, 7007, 1050, 13301, 13287, 9006, 17002, 2104, 7009, 15235, 13134
sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome to the Shrine of Bertoxxulous! You appear to be [new to the shrine]. I do not remember seeing you around.");
	}
	elsif ($text=~/new to the shrine/i) {
		quest::say("New blood to spread Bertoxxulous' disease? We presently need the help of a [young shadowknight]. There are certain deeds which must be carried out.");
	}
	elsif ($text=~/young shadowknight/i) {
		quest::say("Then let your supreme task be the extermination of the Priests of Life. Know that they threaten the will of our Lord Bertoxxulous. For every fallen paladin and cleric of the Temple of Life. you shall rise within our ranks.  So... do you [loathe paladins]?");
	}
	elsif ($text=~/loathe paladins/i) {
		quest::say("As do we all. The paladins of Qeynos come from either the Hall of Thunder or the Temple of Life. We have put a bounty upon their heads. Destroy these knights and return either the Order of Thunder or the prayer beads of these inferior men. There has even been a report from [Commander Kane].");
	}
	elsif ($text=~/commander kane/i) {
		quest::say("Kane Bayle is the Commander of the Qeynos Guard. He has found it advantageous to befriend the Bloodsabers. We share a [common goal]. He assists us in many ways. He has some new information to reveal.  Go and tell him you are a Bloodsaber. Do not speak with him while he is [on duty]!!");
	}
	elsif ($text=~/common goal/i) {
		quest::say("Kane Bayle and the leaders of this shrine all wish to overthrow the rule of Antonius Bayle. He, for power, and we for the glory of Bertoxxulous. From this city, our diseased lord shall appear and tread across the land spitting death from his mouth and deforming the land. His glory shall be eternal!");
	}
	elsif ($text=~/on duty/i) {
		quest::say("Kane is quartered within the gatehouse of Qeynos while on duty. At times he can also be found within this shrine.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13287 - Order of Thunder
	if (plugin::takeItems(13287 => 1)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("Ha! You must have slain a member of the Knights of Thunder. These pitiful knights have been a thorn in our side for far too long. Take this reward and continue the work of Bertoxxulous.");
			#:: Give a random reward: 5013 - Rusty Short Sword, 5016 - Rusty Broad Sword, 7007 - Rusty Dagger, 1050 - Rat Fur Cap, 13301 - Rat Shaped Ring
			quest::summonitem(quest::ChooseRandom(5013, 5016, 7007, 1050, 13301)); # Item(s): Rusty Short Sword (5013)
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(221, 10);		#:: + Bloodsabers
			quest::faction(262, -1);		#:: + Guards of Qeynos
			quest::faction(296, 1);			#:: + Opal Darkbriar
			quest::faction(341, -2);		#:: - Priests of Life
			quest::faction(230, 1);			#:: + Corrupt Qeynos Guards
			#:: Grant a small amount of experience
			quest::exp(500);
		}
		else {
			#:: There is some evidence that nothing is said.
			#:: Return a 13287 - Order of Thunder
			quest::summonitem(13287); # Item: Order of Thunder
		}
	}
	#:: Match a 13296 - Prayer Beads
	elsif (plugin::takeItems(13296 => 1)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("Fine work! One less threat to our shrine. Take this. It shall help you become a great asset to our shrine. Go forth and spread the disease."); 
			#:: Give a random reward: 5013 - Rusty Short Sword, 5016 - Rusty Broad Sword, 7007 - Rusty Dagger, 1050 - Rat Fur Cap, 13301 - Rat Shaped Ring
			quest::summonitem(quest::ChooseRandom(5013, 5016, 7007, 1050, 13301)); # Item(s): Rusty Short Sword (5013)
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(221, 10);		#:: + Bloodsabers
			quest::faction(262, -1);		#:: + Guards of Qeynos
			quest::faction(296, 1);			#:: + Opal Darkbriar
			quest::faction(341, -2);		#:: - Priests of Life
			quest::faction(230, 1);			#:: + Corrupt Qeynos Guards
			#:: Grant a small amount of experience
			quest::exp(500);
		}
		else {
			#:: There is some evidence that nothing is said.
			#:: Return a 13296 - Prayer Beads with no charges
			quest::summonitem(13287,0); # Item: Order of Thunder
		}
	}
	#:: Match a 13908 - Busted Prayer Beads
	elsif (plugin::takeItems(13908 => 1)) {
		quest::say("You fool! Brother Trintle was our mole within the Priests of Life. Now you have killed him. For this you shall die!");
		#:: Set factions
		quest::faction(221, -50);			#:: - Bloodsabers
		quest::faction(262, 7);				#:: + Guards of Qeynos
		quest::faction(296, -5);			#:: - Opal Darkbriar
		quest::faction(341, 12);			#:: + Priests of Life
		quest::faction(230, -2);			#:: - Corrupt Qeynos Guards
		#:: Attack the player who triggered the event
		quest::attack($name);
	}
	#:: Match a 13134 - Hurrieta's Bloody Dress
	elsif (plugin::takeItems(13134 => 1)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("Hahaha.. I see you actually killed a respected, well-known citizen of Qeynos. No loss for them, but you are certainly a gain for our shrine. Maybe this shall do you some good. If not now, then surely later. You may need it when the Qeynos Guards hunt you down.");
			#:: Give a random reward: 9006 - Wooden Shield, 17002 - Belt Pouch, 2104 - Patchwork Tunic, 7009 - Rusty Spear, 13301 - Rat Shaped Ring, 15235 - Spell: Invisibility vs Undead
			quest::summonitem(quest::ChooseRandom(9006, 17002, 2104, 7009, 13301, 15235)); # Item(s): Wooden Shield (9006)
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(221, 10);		#:: + Bloodsabers
			quest::faction(262, -1);		#:: + Guards of Qeynos
			quest::faction(296, 1);			#:: + Opal Darkbriar
			quest::faction(341, -2);		#:: - Priests of Life
			quest::faction(230, 1);			#:: + Corrupt Qeynos Guards
			#:: Grant a small amount of experience
			quest::exp(500);
		}
		else {
			#:: There is some evidence that nothing is said.
			#:: Return a 13134 - Hurrieta's Bloody Dress
			quest::summonitem(13134,0); # Item: Hurrieta's Bloody Dress
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
