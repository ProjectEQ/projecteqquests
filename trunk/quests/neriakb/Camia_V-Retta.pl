sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18753)) { 
		$client->Message(15,"Camia V'Retta turns her hateful scowl towards you as you get your bearings. 'You best be here for training or I will have your tongue! If you are here to learn the ways of the Enchanter, read the note in your inventory and then hand it to me so we can begin.'");
  }
}

sub EVENT_SAY {
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
  if (plugin::check_handin(\%itemcount, 18753 => 1)) { #tattered note
    quest::say("Greetings, and welcome to the Tower of the Spurned! I am Camia V'Retta, master enchantress. Here is your guild tunic, wear it with pride. Once you are ready to begin your training please make sure that you see Morgalanth Tal'Raeloen, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
    quest::summonitem(13582); #Ruined Red Robe*
		quest::faction(331,10); #The Spurned
		quest::faction(322,-15); #The Dead
    quest::exp(100);
  }
	else {
  	quest::say("I have no need for this $name, you can have it back.");
  	plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:neriakb  ID:41052 -- Camia_V`Retta