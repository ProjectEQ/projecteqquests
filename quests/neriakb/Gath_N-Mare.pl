sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18755)) { 
		$client->Message(15,"A sly looking Dark Elf turns to address you. 'Come to me, young Wizard. I am Gath N'Mare. Read the note in your inventory and hand it to me so that you may begin on the path of the Wizard. True Power can be yours should you have the will to train hard enough!'");
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
	if (plugin::check_handin(\%itemcount, 18755 => 1)) { #Tattered Note
		quest::say("I am Gath N'Mare, master wizard of the Tower of the Spurned. Welcome to our guild. Let's get started, shall we?  Here is your tunic, represent us well with it. Morgalanth Tal'Raeloen is our beginning guild trainer. He will teach you the basics and give you a solid learning foundation of magic. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
		quest::summonitem(13584); #Stained Red Robe*
		quest::faction(331,100); #The Spurned
		quest::faction(322,-15); #The Dead
		quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:neriakb  ID:41053 -- Gath_N`Mare