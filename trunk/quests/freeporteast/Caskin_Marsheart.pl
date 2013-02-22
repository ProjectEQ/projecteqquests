sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18747)) { 
		$client->Message(15,"As you get your bearings, you can hear a beautiful song. It almost seems to draw you towards it. It's as if you can hear a voice in your head as the music surrounds you. 'Welcome to Marsheart's Chords. young bard. I am Caskin Marsheart. To begin your training as a bard, read the note in your inventory and hand it to me.' The music then fades as quickly as it had begun.");
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
	if(plugin::check_handin(\%itemcount, 18747 => 1)) { #Tattered Note
		quest::say("Welcome to the guild, here's your guild tunic. Once you are ready to begin your training please make sure that you see Sten Harnak, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13571); #Colorfully Patched Tunic*
		quest::ding();
		quest::faction(192,10); #League of Antonican Bards
		quest::faction(184,10); #Knights of Truth
		quest::faction(135,10); #Guards of Qeynos
		quest::faction(273,-15); #Ring of Scale
		quest::faction(207,-15); #Mayong Mistmoore
		quest::exp(100);
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Bard');
	}
  plugin::return_items(\%itemcount);
}
