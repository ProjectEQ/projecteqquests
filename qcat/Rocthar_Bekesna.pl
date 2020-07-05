# items: 51121, 51122, 18853, 13598
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18853)) { 
		$client->Message(15,"A dark whisper of a voice seems to echo in your mind. 'Welcome young warrior of Bertoxxulous. I am Rocthar Bekesna, you're new Guild Master. Read the note in your inventory and then hand it to me to begin your training.'");
  }
}

sub EVENT_SAY {
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121); # Item: Tradeskill Basics : Volume I
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122); # Item: Tradeskill Basics : Volume II
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18853 => 1)) { #Blood Stained Note
		quest::say("A new warrior of hate always pleases me. Here is your tunic, please return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13598); #Ruined Training Tunic*
		quest::ding();
		quest::faction(221,100); #Bloodsabers
		quest::faction(262,-15); #Guards of Qeynos
		quest::faction(296,10); #Opal Dark Briar
		quest::faction(341,-25); #Priest of Life
		quest::faction(230,5); #Corrupt Qeynos Guards
		quest::exp(100);
	}
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  }
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:qcat  ID:45081 -- Rocthar_Bekesna
