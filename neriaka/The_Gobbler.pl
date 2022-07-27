# items: 12203, 13386, 13385, 10021
sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Meat!! You need meat. Me gots meat!! High elf meat, dwarf meat, human meat, [HEHE meat], [froggy legs]. Me got a lot.");
	}
	elsif ($text=~/HEHE meat/i) {
		quest::say("HEHE meat? It human, Erudite 'n high elf, mashed together. Mmmm. Very tasty!");
	}
	elsif ($text=~/froggy legs|froglok legs/i) {
		quest::say("Froggy legs come from far away. Me get from friend, [Chef Dooga]. It not tasty. Trolls like it. Eat it up much. They eat too much froggy. Me glad [Nerbilik] leave Neriak!! He eat way too much froggy.");
	}
	elsif ($text=~/chef dooga/i) {
		quest::say("Friend in Oggok is Chef Dooga. Chef she is. Used to work in Neriak. She beautiful. She supply the Gobbler with [froglok legs]. They very low now. Fat trolls eat too many!! Me need to [pick up froglok legs].");
	}
	elsif ($text=~/pick up froglok legs/i) {
		quest::say("That good news. Oggok far away. Me got no time to go. If you go speak to Chef Dooga, say you pick up froglok legs. You bring back and me give you coin, maybe even something good.");
	}
	elsif ($text=~/nerbilik/i) {
		quest::say("Big and fat troll Nerbilik is. He leave to fish in tearsy ocean. Me promised to deliver him food or he come bak. The Gobbler needs some dumb person to [deliver grub locker] to Nerbilik.");
	}
	elsif ($text=~/deliver grub locker/i) {
		quest::say("Good. Me wrap order of dwarf pickles in.. HEY!! Me out of special wrapping paper!! Hmm.. Here. Me use dis. Now, <..click.. Locks grub locker> Here. You take to Nerbilik in tearsy ocean and he pay you. No think of opening locker. Only Nerbilik has key.");
		#:: Give a 12203 - Grub Locker
		quest::summonitem(12203); # Item: Grub Locker
	}
}

sub EVENT_ITEM {
	#:: Match a 13384 - Preserved Leg
	if (plugin::takeItems(13384 => 1)) {
		quest::say("Uggh!! Froglok legs!! Me hate smelly legs, but me need it for fat trolls.");
		my $RandomChance = quest::ChooseRandom(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
		if ($RandomChance == 10) {
			#:: Give a 13386 - Ogre Butcher Gloves
			quest::summonitem(13386); # Item: Ogre Butcher Gloves
			#:: Ding!
			quest::ding();
			#:: Set faction
			quest::faction(353, 5);		#:: + Neriak Ogre
			#:: Grant a small amount of experience
			quest::exp(150);
			#:: Create a hash for storing cash - 100 to 350cp
			my %cash = plugin::RandomCash(100,350);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		elsif ($RandomChance == 9) {
			#:: Give a 13385 - Ogre Meat Cleaver
			quest::summonitem(13385); # Item: Ogre Meat Cleaver
			#:: Ding!
			quest::ding();
			#:: Set faction
			quest::faction(353, 5);		#:: + Neriak Ogre
			#:: Grant a small amount of experience
			quest::exp(150);
			#:: Create a hash for storing cash - 100 to 350cp
			my %cash = plugin::RandomCash(100,350);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		elsif (($RandomChance == 8) || ($RandomChance == 7)) {
			#:: Give a 10021 - Star Rose Quartz
			quest::summonitem(10021); # Item: Star Rose Quartz
			#:: Ding!
			quest::ding();
			#:: Set faction
			quest::faction(353, 5);		#:: + Neriak Ogre
			#:: Grant a small amount of experience
			quest::exp(150);
			#:: Create a hash for storing cash - 100 to 350cp
			my %cash = plugin::RandomCash(100,350);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		elsif ($RandomChance <= 6) {
			#:: Ding!
			quest::ding();
			#:: Set faction
			quest::faction(353, 5);		#:: + Neriak Ogre
			#:: Grant a small amount of experience
			quest::exp(150);
			#:: Create a hash for storing cash - 100 to 350cp
			my %cash = plugin::RandomCash(100,350);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}	
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
