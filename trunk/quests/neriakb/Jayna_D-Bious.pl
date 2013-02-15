sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class eq "Magician")) { 
		$client->Message(15,"Jayna D'Bious scowls at you. 'Yes, what is it? If you are here for training, read the note in your inventory and hand it to me. Otherwise I don't have time to waste with you!'");
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
	if (plugin::check_handin(\%itemcount, 18754 => 1)) { #Tattered Note
		quest::say("Welcome, young magician. I am Jayna D'Bious. You have much to learn, so let's get you started. Here is your guild tunic. Once you are ready to begin your training please make sure that you see Morgalanth Tal'Raeloen, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
		quest::summonitem(13583); #Torn Red Robe*
		quest::faction(331,10); #The Spurned
		quest::faction(322,-15); #The Dead
		quest::exp(100);
	}
	else {
  	quest::say("I have no need for this $name, you can have it back.");
  	plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:neriakb  ID:41054 -- Jayna_D`Bious