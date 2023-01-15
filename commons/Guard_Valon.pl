# items: 17975, 13885, 12273, 12272
sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, traveler! If you wish to walk upon the road to Freeport, you will pay the toll of two silver pieces. And you should. It is not safe to stray from the pathway. There are many [dangers in the Commonlands].");
	}
	elsif ($text=~/dangers in the commonlands/i) {
		quest::say("The orcs have been a nuisance of late. Many travelers have perished at the hands of the orc pawns. Would you like to [assist the Freeport Militia] in ridding the lands of the orcs?");
	}
	elsif ($text=~/assist the freeport militia/i) {
		quest::say("Sir Lucan would be proud!! Patrol the Commonlands and watch for any orc pawns. Should you find any orc pawn picks on them, I will pay you for every four you return to me. Be off, then! For the glory of Freeport!!");
	} 
	elsif ($text=~/hunt dervish cutthroats/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("You will make a fine reserve!! Take this bag and fill it with Dervish Cutthroat Insignia Rings. When they are combined and returned to me you shall be accepted into the Reserve Freeport Militia!!");
			#:: Give a 17975 - Bag for Cutthroat Rings
			quest::summonitem(17975); # Item: Bag for Cutthroat Rings
		}
		else {
			quest::say("A few less Orc Pawns and perhaps turning in Orc Pawn Picks to me may increase my trust in you.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match four 13885 - Orc Pawn Pick
	if (plugin::takeItems(13885 => 4)) {
		quest::say("You have done well. Keep up the good work and we may trust you to [hunt dervish cutthroats] which in turn will allow you to join the Reserve Freeport Militia.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(330, 3);			#:: + Freeport Militia
		quest::faction(336, 1);			#:: + Coalition of Tradefolk Underground
		quest::faction(281, -1);		#:: - Knights of Truth
		quest::faction(362, -1);		#:: - Priests of Marr
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Grant a cash reward of one gold
		quest::givecash(0, 0, 1, 0);
	}
	#:: Match three 13885 - Orc Pawn Pick
	elsif (plugin::takeItems(13885 => 3)) {
		quest::say("I cannot reward you until you hand me four Orc Pawn Picks. So says Captain Hazran.");
		#:: Return three 13885 - Orc Pawn Pick
		quest::summonitem(13885); # Item: Orc Pawn Pick
		quest::summonitem(13885); # Item: Orc Pawn Pick
		quest::summonitem(13885); # Item: Orc Pawn Pick
	}
	#:: Match two 13885 - Orc Pawn Pick
	elsif (plugin::takeItems(13885 => 2)) {
		quest::say("I cannot reward you until you hand me four Orc Pawn Picks. So says Captain Hazran.");
		#:: Return two 13885 - Orc Pawn Pick
		quest::summonitem(13885); # Item: Orc Pawn Pick
		quest::summonitem(13885); # Item: Orc Pawn Pick
	}
	#:: Match one 13885 - Orc Pawn Pick
	elsif (plugin::takeItems(13885 => 1)) {
		quest::say("I cannot reward you until you hand me four Orc Pawn Picks. So says Captain Hazran.");
		#:: Return one 13885 - Orc Pawn Pick
		quest::summonitem(13885); # Item: Orc Pawn Pick
	}
	#:: Match a 12272 - Bag of Cutthroat Rings
 	elsif (plugin::takeItems(12272 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Excellent work, $name!! You are quite formidable. Maybe soon you shall aid in our efforts to rid the Northern part of Freeport of the paladins!! Until then keep up the good work. Take this Armory Token to the Militia Armorer in the Militia House in Freeport to receive your tunic. He may not be there, but I assure you he will show up at some time. On the second floor. Hail Sir Lucan!!");
			#:: Give a 12273 - Militia Armory Token
			quest::summonitem(12273); # Item: Militia Armory Token
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(330, 10);		#:: + Freeport Militia
			quest::faction(336, 1);			#:: + Coalition of Tradefolk Underground
			quest::faction(281, -1);		#:: - Knights of Truth
			quest::faction(362, -1);		#:: - Priests of Marr
		}
		else {
			quest::say("A few less Orc Pawns and perhaps turning in Orc Pawn Picks to me may increase my trust in you.");
			#:: Return a 12272 - Bag of Cutthroat Rings
			quest::summonitem(12272); # Item: Bag of Cutthroat Rings
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
