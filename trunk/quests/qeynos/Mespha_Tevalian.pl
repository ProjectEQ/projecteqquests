sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18720)) { 
		$client->Message(15,"As you glance about the room, Mespha Tevalian greets you. 'Why hello there. Are you perhaps a new recruits? If you wish to learn the ways of the Enchanter, read the note in your inventory and hand me your note to start your training.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::say("Greetings.. I am Mespha Tevalian, Master Enchantress of the Hall of Sorcery and the Order of Three. Here, we all study the three circles of magic, and lend our services to citizens of Qeynos. Rumors of an underground group calling themselves the Bloodsabers have recently been spreading throughout the city. It is our duty to help local guards protect Qeynos' citizens from this new evil."); 
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
	if(plugin::check_handin(\%itemcount, 18720 => 1)){ #Tattered Note
		quest::say("Greetings $name. Welcome to the Hall of Sorcery. You have much to learn. Wear this tunic and represent us well. See my apprentice, Unsar Koldhagon, he will get you started and help you with your studies. Once you are ready to begin your hunting training please see Juegile Sohgohm, he will assist you in some tasks for your early adventures. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13542); #Faded Blue Robe*
		quest::ding();
		quest::faction(240,10); #Order of Three
		quest::faction(21,-15); #Bloodsabers
		quest::faction(135,10); #Guards of Qeynos
		quest::faction(235,-15); #Opal Dark Briar
		quest::exp(100); 
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
		plugin::return_items(\%itemcount);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos  ID:1068 -- Mespha_Tevalian