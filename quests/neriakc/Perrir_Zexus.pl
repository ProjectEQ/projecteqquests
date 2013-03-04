sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18756)) { 
		$client->Message(15,"A sly looking Dark Elf turns to address you. 'Come to me, young Cleric. I am Perrir Zexus. Read the note in your inventory and hand it to me so that you may begin on the path of the Cleric True power can be yours should you have the will to train hard enough!'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::say("Salutations, $name! Your devotion to our Lord Innoruuk is evident in your actions and on your soul. As a member of the Spires of Innoruuk, you are required to obtain and wear the symbol of your station among the clergy. I can award you the [hematite symbol of Innoruuk] worn by the initiates of the Spires.");
	}
	if($text=~/hematite symbol of Innoruuk/i) {
		quest::say("The forest beyond the gates of our grand city has been shaped by the magic of our Lord Innoruuk to be more hospitable to our kind. There are halfling druids in the service of Karana who have set up shrines there in hopes of restoring the forest to its former state. They could never succeed in their task with their feeble powers granted by their insignificant god, yet still, they are a nuisance. Bring me four of the holy symbols worn by the druids and I shall grant you the initiate symbol of Innoruuk.");
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
	if(plugin::check_handin(\%itemcount, 14550 => 4)) {#Woven Grass Amulets
		quest::emote("laughs. 'Here, take this then!  You are now and initiate of Innoruuk.  Speak with Ithvol K`Jasn for further advancement.'");#text made up
		quest::summonitem(1369);#Initiate Symbol of Innoruuk
		quest::exp(2000);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
	elsif(plugin::check_handin(\%itemcount, 18756 => 1)) { #Tattered Note
		quest::say("Welcome, child of Hate. I am Perrir Zexus, High Priest. We all draw power from the very source that created us, the will of Innoruuk. Here, put on this tunic. It is the tunic of our guild. Once you are ready to begin your training please make sure that you see High Priest Alexandrian, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
		quest::summonitem(13585); #Crimson Training Tunic*
		quest::faction(256, 10); #Priests of Innoruuk
		quest::faction(177, 10); #King Naythox Thex
		quest::faction(258, -15); #Priests of Marr
		quest::faction(43, -15); #Clerics of Tunare
		quest::faction(257, -15); #Priests of Life
		quest::faction(260, -15); #Primordial Malice
		quest::exp(100); 
	}
	else {
  	quest::say("I don't need this.");#text made up
  	plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:neriakc  ID:42084 -- Perrir_Zexus 