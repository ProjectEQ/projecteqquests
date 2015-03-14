my $count = 0;

sub EVENT_SPAWN {
	quest::settimer("song",5);
}

sub EVENT_SIGNAL {
	quest::say("Ack, I need somethin' light to clear the taste of salt from my mouth.");
}

sub EVENT_TIMER {
	$count++;
	if ($count == 1) {
		quest::say("On one sunny afternoon, I sawr a dwarf a'wanderin'");
	}
	if ($count == 2) {
		quest::say("He was staggerin' and mumblin' and fallin'.");
	}
	if ($count == 3) {
		quest::say("I caught up and asked him if he needed help,");
	}
	if ($count == 4) {
		quest::say("And he turned and yelled as loud as he's stout:");
	}
	if ($count == 5) {
		quest::say("Git yer flowery songs from my ear,");
	}
	if ($count == 6) {
		quest::say("The light notes will soil me beer!");
	}
	if ($count == 7) {
		quest::say("And if ye don't turn and run fast,");
	}
	if ($count == 8) {
		quest::say("I'll drown yer feet in what I ate last!");
		quest::settimer("song",300);
	}
	if ($count == 9) {
		quest::say("Norrath is so great and so dear");
		quest::settimer("song",5);
	}
	if ($count == 10) {
		quest::say("With all the folk that live here:");
	}
	if ($count == 11) {
		quest::say("Dwarves make lots of ale");
	}
	if ($count == 12) {
		quest::say("High elves are too pale");
	}
	if ($count == 13) {
		quest::say("Trolls are slimy and green");
	}
	if ($count == 14) {
		quest::say("Ogres are very unclean");
	}
	if ($count == 15) {
		quest::say("Gnomes can make things tick");
	}
	if ($count == 16) {
		quest::say("Halflings, masters of the trick");
	}
	if ($count == 17) {
		quest::say("Iksar get by with scales");
	}
	if ($count == 18) {
		quest::say("Vah Shir oft' use their tails");
	}
	if ($count == 19) {
		quest::say("Humans are very plain");
	}
	if ($count == 20) {
		quest::say("Dark elves deal out pain");
	}
	if ($count == 21) {
		quest::say("Frogloks are smarter now");
	}
	if ($count == 22) {
		quest::say("Erudites, the highest brow");
	}
	if ($count == 23) {
		quest::say("Half elves have no city");
	}
	if ($count == 24) {
		quest::say("Wood elves are so pretty");
	}
	if ($count == 25) {
		quest::say("The last Norrathians I'm told");
	} 
	if ($count == 26) {
		quest::say("Are barbarians who love the cold.");
	} 
	if ($count == 27) {
		quest::say("All these folk share these lands,");
	} 
	if ($count == 28) {
		quest::say("Putting it in very good hands.");
		quest::settimer("song",300);
	}
	if ($count == 29) {
		quest::say("In the dark of the fearless night,");
		quest::settimer("song",5);
	}
	if ($count == 30) {
		quest::say("Fantastic stories retold by torchlight.");
	}
	if ($count == 31) {
		quest::say("A tale of a rogue of great prowess.");
	}
	if ($count == 32) {
		quest::say("An enchanter as his revered mistress.");
	}
	if ($count == 33) {
		quest::say("Then there's a shadow knight who found the two,");
	}
	if ($count == 34) {
		quest::say("He swore to them he would always be true.");
	}
	if ($count == 35) {
		quest::say("Some say they were brought together by chance,");
	}
	if ($count == 36) {
		quest::say("Others think that it was circumstance.");
	}
	if ($count == 37) {
		quest::say("No matter how they came to be the closest three,");
	}			
	if ($count == 38) {
		quest::say("They are the greatest adventurers that will ever be.");
                quest::settimer("song",300);
        }
        if ($count == 39){
		quest::say("Tra-la-la and a-diddly-dee.");
                quest::settimer("song",5);
        }
        if ($count == 40) {
                quest::say("The gnome bit the ogre on the knee.");
        }
        if ($count == 41) {
                quest::say("Tra-la-la and a-diddly-dum.");
        }
        if ($count == 42) {
                quest::say("The ogre bit off the gnome's thumb.");
        }
        if ($count == 43) {
                quest::say("Then the ogre said as he turned to me,");
        }
        if ($count == 44) {
                quest::say("Dat fer singin' 'Tra-la-la and a-diddly-dee.'");
                quest::settimer("song",295);
        }
	if ($count == 45) {
		$count = 0;
		quest::settimer("song",5);
	}
}
