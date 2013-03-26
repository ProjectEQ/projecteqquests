sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
    if(plugin::check_hasitem($client, 18855)) {
        $client->Message(15, "You find yourself in a small, dimly lit room. A dark figure steps from the shadows and greets you. 'Welcome young apprentice. I am Heneva Jexsped your new Guild Master. I am glad you found us. Read the note in your inventory and hand it to me when you wish to begin your training.'");
    }
}

sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::say("Yes. yes. yes.  Hail to you. too, $name.  Now, quit bugging me!"); 
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
	if(plugin::check_handin(\%itemcount, 18855 => 1)) { # A tattered note
		quest::say("Welcome, friend. I see more than a slight glimmer of hate in your eyes. Good, for we have much work to do. Once you are ready to begin your training please make sure that you see Marv Orilis, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
		quest::summonitem(13565); # Old Stained Robe
		quest::faction(86,10); #Dismal Rage
		quest::faction(184,-15); #Knights of Truth
		quest::faction(235,10); #Opal Dark Briar
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:freporte -- Heneva_Jexsped