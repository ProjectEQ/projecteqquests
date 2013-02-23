sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
    if(plugin::check_hasitem($client, 18741)) {
        $client->Message(15, "A noble Aviak stands before you. 'Hello there. Welcome. I assume you are here to train in the ways of the Enchanter. If so, please read the note in your inventory and hand it to me when you wish to start your training. Soon you will see that all you know is but an illusion.'");
    }
}

sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Those fools! I can't believe they ran off with it. They have no idea what power lies within that [chest].");
	}
	if ($text=~/chest/i) {
		quest::say("My lockbox full of powerful spell scrolls and magical artifacts. They've been passed down in my family through the ages, and now they're gone. If used incorrectly they could. . . Oh my, I don't even want to think about it! This is terrible. . . Just, just terrible. I couldn't possibly expect anyone to help me [find] it.");
	}
	if ($text=~/find/i) { #this starts a shared task (instance) - "The Ooze News" which will need to be implement later.
		quest::say("You would do that for me? I don't know how I would ever be able to repay you. Do what you like with the contents; just return to me my Vial of Desolution. That little guy almost wiped out all of Ak'Anon years back. Use any of the other contents to your liking if you deem it prudent to your success. Most of the potions you may find are simply novelty, but could prove to be useful.");
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
	if(plugin::check_handin(\%itemcount, 18741 => 1)) { # A tattered note
		quest::say("Greetings, I am Romiak Jusathorn, Master Enchanter of the Academy. Take this.. it's our guild robe; it will help protect you in this harsh environment. Once you are ready to begin your training please make sure that you see Shana Liskia, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
		quest::summonitem(13560); # Old Violet Robe
		quest::ding();
		quest::faction(11,10); #Arcane Scientists
		quest::faction(184,10); #Knights of Truth
		quest::faction(235,-15); #Opal Dark Briar
		quest::faction(105,-15); #The Freeport Militia
		quest::exp(100);
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
	}
	plugin::return_items(\%itemcount);
}


#END of FILE Zone:freportw  ID:9069 -- Romiak_Jusathorn