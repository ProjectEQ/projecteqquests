sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18766)) { 
		$client->Message(15,"Furtog Ogrebane glances your way. 'Ah a new recruit! Oh, how I enjoy meeting new recruits! With my training one day you could be a powerful member of the Stormguard! Read the note in your inventory and then hand it to me when you wish to begin your training!");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Hail. mighty $name! Welcome to Stormguard Hall. I am Captain Furtog Ogrebane. only surviving descendant of the legendary Trondle Ogrebane. slayer of the [Mudtoes]. If you wish to serve the grand city of Kaladim. I urge you to speak with any of the trainers. Good day.");
	}
	if($text=~/mudtoes/i){
		quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
	}
	if($text=~/trondle/i){
		quest::say("Trondle was my great father and slayer of the Mudtoes. He was killed by those vile Crushbone orcs. If you truly wish to help Kaladim remain safe. speak with trainer Canloe Nusback. Say that you are ready to serve Kaladim.");
	}
	if($text=~/searching for the mudtoes/i){
		quest::say("I have heard persistent rumors of two Mudtoe ogres who survived the slaughter.  Go to the port of Butcherblock.  Those dock hands must have heard of the name [Mudtoe].  Bring me the remaining heads of the Mudtoes!!  I want all the Mudtoes dead!!  Do not return until you have them both!!");
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18766 => 1)){ # Recruitment Letter
		quest::say("Greetings, friend, and welcome to Stormguard Hall! I am Furtog Ogrebane, Captain of the Guard. We shall train you to be a fearless warrior, who will serve and protect King Kazon well. Here is your tunic. Once you are ready to begin your training please make sure that you see Dirjadak Barbrawler, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13515); # Dirt Stained Tunic*
		quest::ding();
		quest::faction(314,10); # Storm Guard
		quest::faction(169,10); # Kazon Stormhammer
		quest::faction(219,10); # Miners Guild 249
		quest::faction(215,10); # Merchants of Kaladim
		quest::faction(57,-15); # Craknek Warriors
		quest::exp(100);
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:kaladima  ID:60008 -- Furtog_Ogrebane