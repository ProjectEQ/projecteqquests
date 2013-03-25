sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18718)) { 
		$client->Message(15,"As you glance about the crowded room, Gahlith Wrannstad greets you. 'Why hello there. Are you perhaps a new recruits? If you wish to learn the ways of the Wizard, read the note in your inventory and hand me your note to start your training.'");
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
	if(plugin::check_handin(\%itemcount, 18718 => 1)){ #Tattered Note
		quest::say("Greetings, I am Gahlith, Master of the Wizard's Order of the Hall of Sorcery. Here, we have devoted our lives and souls to the study of the arcane. My apprentice Kazlo Naedra shall tutor you and teach you the fundamentals of sorcery. Once you are ready to begin your hunting training please see Juegile Sohgohm, he will assist you in some tasks for your early adventures. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13508); #Blue Training Robe*
		quest::ding();
		quest::faction(240,10); #Order of Three
		quest::faction(21,-15); #Bloodsabers
		quest::faction(135,10); #Guards of Qeynos
		quest::faction(235,-15); #Opal Dark Briar
		quest::exp(100); 
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos  ID:1064 -- Gahlith_Wrannstad