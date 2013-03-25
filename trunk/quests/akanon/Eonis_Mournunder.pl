sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18771)) { 
		$client->Message(15,"A diminutive, but powerful looking gnome stands before you. 'I am Eonis Mournunder. The Dark Reflection has called you. Read the note in your inventory and hand it to me when you wish to begin your training. Your destiny awaits!'");
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
	if(plugin::check_handin(\%itemcount, 18771 => 1)) { # Stained Letter
		quest::say("Hmmm.. As you wish, we will train you in our dark ways, but, now this, our art carries a high price, and there is no turning back for you now. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you. Once you are ready to begin your training please make sure that you see Tilkzog Mournunder, he can assist you in developing your hunting and gathering skills.");
		quest::summonitem(13524); # Dark Gold Felt Robe*
		quest::ding();
		quest::faction(71,10); #Dark Reflection
		quest::faction(91,-15); #Eldritch Collective
		quest::faction(115,-15); #Gem Choppers
		quest::faction(76,-15); #Deepmuses
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}