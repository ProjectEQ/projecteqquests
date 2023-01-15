# items: 51121, 51122, 13537, 5047, 6012
sub EVENT_SPAWN {
	#:: Set up a proximity, 100 units across
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
	#:: Match for 18786 - Tattered Note
	if (plugin::check_hasitem($client, 18786)) { 
		$client->Message(15,"As you orient yourself amongst the peacefulness of the treetop city of Kelethin, a melodic, peaceful voice breaks the silence. 'I am the Heartwood Master. Read the note in your inventory and when you wish to begin your training, hand it to me. We must pledge our lives to protect the great forest, Faydark against all those who would wish it harm!'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, child of Tunare. As druids of The Mother of All, we may only use blunt weapons, and the scimitar, all other blades are forbidden. Prove your devotion by bringing me a rusty short sword, a rusty long sword, a rusty broad sword, and a rusty bastard sword. I will destroy them and reward your faith.");
	}
	if ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [" . quest::saylink("second book") . "], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121); # Item: Tradeskill Basics : Volume I
	}
	if ($text=~/second book/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give a 51122 - Tradeskill Basics : Volume II
		quest::summonitem(51122); # Item: Tradeskill Basics : Volume II
	}
}

sub EVENT_ITEM {
	#:: Match a 18786 - Tattered Note
	if (plugin::takeItems(18786 => 1)) {
		quest::say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Once you are ready to begin your training please make sure that you see Aliafya Mistrunner, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [" . quest::saylink("trades") . "] you will have available to you.");
		#:: Give a 13537 - Green and Tan Tunic*
		quest::summonitem(13537); # Item: Green and Tan Tunic*
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Set factions
		quest::faction(310,100);	#:: + Soldiers of Tunare
		quest::faction(279,15);		#:: + King Tearis Thex
		quest::faction(246,15);		#:: + Faydark's Champions
	}
	#:: Match a 5013 - Rusty Short Sword, 5016 - Rusty Broad Sword, 5019 - Rusty Long Sword and 5022 - Rusty Bastard Sword
	if (plugin::takeItems(5013 => 1, 5016 => 1, 5019 => 1, 5022 => 1)) {
		quest::say("You have done well, child! Take this as a blessing from Tunare for doing her will.");
		#:: Randomly give a 5047 - Tarnished Scimitar or 6012 - Worn Great Staff
		quest::summonitem(quest::ChooseRandom(5047,6012)); # Item(s): Tarnished Scimitar (5047), Worn Great Staff (6012)
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(250);
		#:: Create a hash for storing cash - 500 to 700cp
		my %cash = plugin::RandomCash(500,700);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Set factions
		quest::faction(310,1);		#:: + Soldiers of Tunare
		quest::faction(279,1);		#:: + King Tearis Thex
		quest::faction(246,1);		#:: + Faydark's Champions
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
