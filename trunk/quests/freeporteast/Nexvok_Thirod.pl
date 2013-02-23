sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
    if(plugin::check_hasitem($client, 18854)) {
        $client->Message(15, "A dark whisper of a voice seems to echo in your mind. 'Welcome young wizard of Innoruuk. I am Nexvok Thirod, your new Guild Master. Read the note in your inventory and hand it to me to begin your training.'");
    }
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("I am Nexvok, master wizard of the Dismal Rage.  My associates Heneva and Konious and I provide our services to master Zarn on a regular basis.  People of our talent are in high demand. and Pietro pays well, so we are, of course, very loyal.");
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
	if(plugin::check_handin(\%itemcount, 18854 => 1)) { # A tattered note
		quest::say("Ah ha.. Fresh meat. here, put this on.. you're one of us now. Do your best to do your worst. Once you are ready to begin your training please make sure that you see Marv Orilis, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13564); # Dirty Torn Robe*
		quest::ding();
		quest::faction(86,10); #Dismal Rage
		quest::faction(184,-15); #Knights of Truth
		quest::faction(235,10); #Opal Dark Briar   
		quest::exp(100);
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
	}
	plugin::return_items(\%itemcount);
}

