sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18738)) { 
		$client->Message(15,"As you bask in the majesty of the Temple of Marr, an important looking individual, clad in shining metal armor turns to greet you. 'I can spot a new recruit a mile away. Welcome to the Temple of Marr. I am Gygus Remnara. Read the note in your inventory and hand it to me to begin your training. I wish you the best of luck.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i){
		quest::say("The Temple of Marr welcomes you. I am Gygus Remnara. High Sentinel for the Sentries of Passion. We are the order of paladins within the Priests of Marr and whose charge it is to protect the holy Temple of Marr.");
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
	if(plugin::check_handin(\%itemcount, 18738 => 1)){ #A tattered note
		quest::say("Welcome to the Sentries of Passion. We are the protectors of the Temple of Marr. Wear our tunic with pride, young knight! Find your wisdom within these walls and in the words of our priests. And remember to aid all who follow the twin deities, Mithaniel and Erollisi Marr. Once you are ready to begin your training please make sure that yo see Edwardian Holyblade, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13556); #White and Blue Tunic
		quest::ding();
		quest::faction(258,10); #Priests of Marr
		quest::faction(105,-15); #The Freeport Militia
		quest::faction(184,10); #Knight of Truth
		quest::exp(100);
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:freportn  ID:8028 -- Gygus_Remnara