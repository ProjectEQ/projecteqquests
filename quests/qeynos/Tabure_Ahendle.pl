sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18707)) { 
		$client->Message(15,"A deep voice breaks the silence as you attempt to get your bearings. 'Come young recruit, I sense your apprehension. You will never make an adequate warrior with fear clouding your mind. I am Tabure Ahendle, Guild Master for the Steel Warriors. Read the note in your inventory and then hand it to me to begin your training.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("What have we here?  Perhaps a future Ebon Strongbear?  A [member of the Steel Warriors]?  If the way of the warrior is not to your liking, might I suggest joining the League of Antonican Bards?  The only damage you might take there is a sore throat! HAHAHA!  You don't look completely useless however.  You may be able to [assist] me.");
	}
	if($text=~/steel warriors/i){
		quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild."); 
	}
	if ($text=~/something else/i) {
		quest::say("I had an apprentice who decided to explore the islands in Erud's Crossing.  The boy was a fool, but he had a map with him that I need recovered.  Find my map and I may have something for you");#Text added by quest writer, insert correct text if known.  
	}
	if ($text=~/assist/i) {
		quest::say("I need a rug for my home, I want this rug to be made from Kobold hides.  You can do me a favor and fetch me some hides so that I can make the rug.  4 should be sufficient.  You can find the runts around Erudin.  Do this and I may have something for you.");#text added by quest writer.
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
	if (plugin::check_handin(\%itemcount, 18707 => 1)) { #Recruitment Flyer
		quest::say("Welcome to the Hall of Steel, our swords are strong, and our warriors stronger. Here is our guild tunic. Brin Stolunger is in charge of our new recruits. Go see him, and he'll teach the basics. You look like you'll make a fine addition to our guild. Once you are ready to pave your path to glory return to me for some initial armor quests. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13572); #Dirty Training Tunic*
		quest::ding();
		quest::faction( 311, 10); #Steel Warriors
		quest::faction( 135, 10); #Guard of Qeynos
		quest::faction( 53, -15); #Corrupted Qeynos Guard
		quest::faction( 105, -15); #The Freeport Militia
		quest::faction( 184, 10); #Knight of Truth
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 13423 => 1)) {
		quest::say("By Strongbear you found it!  Well I guess I did promise you something.  Here you go $name.");#more invented text.
		quest::summonitem(5082);
		quest::faction( 135, 10);
		quest::faction( 184, 10);
		quest::faction( 311, 10);
		quest::faction( 53, -15);
		quest::faction( 105, -15);
		quest::exp(500);
		quest::givecash(0,0,3,2);    
	}
	elsif (plugin::check_handin(\%itemcount, 13424 => 4)) {
		quest::say("Yes these will do nicely, I was right you are not completely worthless.  Here I found some old armor you can have. I may have [something else] for you to do as well.");
		quest::faction( 135, 5);
		quest::faction( 184, 5);
		quest::faction( 311, 5);
		quest::faction( 53, -5);
		quest::faction( 105, -5);
		quest::ChooseRandom(2112, 2106, 2111, 2108, 2104);
		quest::givecash(0,4,0,0);
	}
  else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos  ID:1098 -- Tabure_Ahendle