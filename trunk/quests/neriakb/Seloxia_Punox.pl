sub EVENT_SPAWN {
  $x = -1126;
  $y = -59;
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18751)) { 
		$client->Message(15,"The cold voice of a female fills your mind with dread, 'I am Seloxia Punox. Seek me out in the Cauldron of Hate and hand me our note so that you may begin on the path of the Warrior. True power can be yours should you have the will to train hard enough!'");
  }
}

sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::emote("'s eyes flare with fury as her beautiful features twist into a snarl of hatred that echoes her hissing voice, 'How dare you address me in such a fashion?!  I am the leader of the Indigo Brotherhood!!  You are lucky I do not strike you down where you stand!  You shall address me as 'Mistress.'  Many warriors have died so that I might gain this title.'"); 
	}
	if ($text=~/mistress/i) {
		quest::emote("maintains her imposing posture as she indifferently eyes $name, 'You stand now in the Cauldron of Hate -- the Indigo Brotherhood. We are an organization of Neriak's finest warriors whom remain dedicated to Neriak, the Dark Father, and our founder -- his majesty, King Naythox Thex. I am Seloxia Punox, second to only his majesty in command of the Brotherhood. From the Cauldron of Hate, we maintain the protection of the city both within our city walls and beyond in the forest of Nektulos. Perhaps you would wish to prove yourself worthy of our ranks and perform a [little test] of your skills and dedication?'");
	}
	if ($text=~/little test/i) {
		quest::say("My little test is this. I desire a report from Ambassador K'Rynn in the Ogre city of Oggok. You shall run to him. I will not wait until you raise your fighting skills. Combat is not your test. Overcoming the odds is. Fast agile warriors are we. We desire nothing less. Will you [venture to Oggok]?");
	}
	if ($text=~/venture to oggok/i) {
		quest::say("Then you will go at once. Find your own way. Deliver this note to Ambassador K'Rynn and he shall give you the note to return to me. Do not stop to practice your skills. I offer this test to only the young warriors. If you die, then so be it. We need not inferior warriors. Now go!!");
		quest::summonitem(18842); # Sealed Letter (Letter To Krynn)
	}
	if ($text=~/trade/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if ($text=~/second book/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18751 => 1)) {
		quest::say("I shall reserve any official welcoming until you have proven yourself a suitable member for the Indigo Brotherhood. That proof shall be obtained by your progression in your training. See Jarrex N`Ryt, one of my most trusted trainers in the Brotherhood and obey his command carefully if you wish to succeed as a member of the Brotherhood. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13580); #Old Training Tunic*
		quest::ding();
		quest::faction(155, 10); #Indigo Brotherhood
		quest::faction(92,-15); #Emerald Warriors
		quest::faction(311,-15); #Steel Warriors
		quest::faction(260,-15); #Primordial Malice		
		quest::exp(100);
	} 
	elsif (plugin::check_handin(\%itemcount, 18843 => 1)) {   # Sealed Letter (Letter To Seloxia)
		quest::say("Very fine work my young warrior. You may soon be ready to become a Teir'Dal courier. For now we shall reward you. This will assist you in further service to the Indigo Brotherhood and King Naythox Thex.");   
		quest::summonitem(quest::ChooseRandom(5026,1001,1002,1003,1004,1005,5014,5015,5021,5027)); # Random minor items
		quest::faction(155, 10); #Indigo Brotherhood
		quest::faction(92,-5); #Emerald Warriors
		quest::faction(311,-5); #Steel Warriors
		quest::faction(260,-5); #Primordial Malice
		quest::ding();
		quest::exp("250");
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:neriakb  ID:41066 -- Seloxia_Punox