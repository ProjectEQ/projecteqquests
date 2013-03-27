sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18742)) { 
		$client->Message(15,"You find yourself in a small, dimly lit room. A dark figure steps from the shadows and greets you. 'Welcome young apprentice. I am Opal Darkbriar your new Guild Master. I am glad you found us. Read the note in your inventory and hand it to me when you wish to begin your training.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Greetings! You will have to excuse me. I have no time to talk right now and I prefer to be left alone. Please leave.");
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
  if(plugin::check_handin(\%itemcount, 18742 => 1)) { #A tattered note
    quest::say("Welcome to the Guild, here's your guild robe. Now, let's get to work. Once you are ready to begin your training please make sure that yo see Marv Onilis, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I have many things yet to teach you, from advanced combat skills to the various [trades] you may wish to become proficient in.");
    quest::summonitem(13562); #Dark Stained Robe
		quest::ding();
		quest::faction(235,10); #Opal Dark Briar
		quest::faction(86,10); #Dismal Rage
		quest::faction(322,10); #The Dead
		quest::faction(71,10); #Dark Reflection
		quest::faction(21,10); #Bloodsabers
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

