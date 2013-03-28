sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18772)) { 
		$client->Message(15,"An older, male gnome stands before you. 'Welcome young apprentice to the Library Mechanimagica. I am Wuggan Azusphere. Read the note in your inventory and then hand it to me so that we can begin your training.'");
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
  if(plugin::check_handin(\%itemcount, 18772 => 1)) { # Registration Letter
    quest::say("Welcome to Library Mechanimagica. I am Master Magician Wuggan Azusphere. and I will help to teach you the ways of summoning. Here is our guild tunic, make us proud. Once you are ready to begin your training please make sure that you see Xalirilan, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
    quest::summonitem(13521); # Dusty Gold Robe*
		quest::ding();
		quest::faction(91,10); #Eldritch Collective
		quest::faction(71,-15); #Dark reflection
		quest::faction(322,-15); #The Dead	
		quest::faction(115,10); #Gem Choppers
		quest::faction(176,10); #King Ak'Anon
		quest::exp(100);
	}
  plugin::return_items(\%itemcount);
}
