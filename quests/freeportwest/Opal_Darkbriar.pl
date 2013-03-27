sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
    if(plugin::check_hasitem($client, 18739)) {
        $client->Message(15, "As you make your way into a small dimly lit room, a robed figure turns to greet you. 'Hello there. friend. I am Opal Darkbriar, Wizard Guild Master. Should you wish to begin your training, read the note in your inventory and then hand it to me.'");
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
	if(plugin::check_handin(\%itemcount, 18739 => 1)) { # A tattered note ID-18739
		quest::say("Welcome to the Academy of Arcane Sciences. Here's one of our guild robes for you to wear. Once you are ready to begin your training please make sure that you see Shana Liskia, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13558); # Patched Violet Robe ID-13558
		quest::ding();
		quest::faction(11,10); #Arcane Scientists
		quest::faction(184,10); #Knights of Truth
		quest::faction(235,-15); #Opal Dark Briar
		quest::faction(105,-15); #The Freeport Militia	
		quest::exp(100);
	}
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:freeportwest -- Opal_Darkbriar