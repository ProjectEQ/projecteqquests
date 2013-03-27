sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18850)) { 
		$client->Message(15,"As you orient yourself amongst the filth and decay of the catacombs, a menacing figure turns to address you. 'I am Perkon Malok. Should you wish to dedicate your pathetic life to the way of Bertoxxulous and learn the ways of the Magician, read the note in your inventory and hand it to me to begin your training.'");
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
	if(plugin::check_handin(\%itemcount, 18850 => 1)) { #Blood Stained Note
		quest::say("A new initiate always pleases me, here is your tunic. Once you are ready to begin your training please make sure that you see Bruax Grengar, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13595); #Stained Purple Robe*
		quest::ding();
		quest::faction(21,10); #Bloodsabers
		quest::faction(135,-15); #Guards of Qeynos
		quest::faction(235,10); #Opal Dark Briar
		quest::faction(257,-15); #Priest of Life
		quest::faction(53,10); #Corrupt Qeynos Guards
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}
