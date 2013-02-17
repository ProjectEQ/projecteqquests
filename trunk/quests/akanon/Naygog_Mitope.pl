sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18759)) { 
		$client->Message(15,"A diminutive, but powerful looking gnome stands before you. 'I am Naygog Mitope. The Dark Reflection has called you. Read the note in your inventory and hand it to me when you wish to begin your training. Your destiny awaits!'");
  }
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail $name. I train those young gnomes who wish to [serve as a warrior] in the service of the Dark Reflection and our patron. Bertoxxulous the Plaguelord. Decay and destruction are powerful forces that influence Norrath. It is the duty of the Warriors of the Dark Reflection to bring destruction to the weak and injury to the strong so that our fellow gnomes may be reminded of their own mortality and new strong individuals may rise to power before Bertoxxulous decides it is their time to decay and be replaced like countless before them.");
  }
  if($text=~/serve as a warrior/i) {
    quest::say("Ours is the duty of a martyr. to be the hated and feared hand of destruction and catalyst of change. All roads are paved with destruction and in turn are eventually destroyed. All machines are built from the rubble of broken mountains and in turn become rust and bits of metal. You must outfit yourself with the tools of a warrior. crafted from the destruction of archaic clockworks that have long since finished serving the purpose for which they were built. Take this parchment to Windlebeck Tobokog. he will assist you in the construction of a suit of armor. When you have been properly outfitted return to me for [further instruction].");
    quest::summonitem(10986);
  }
  if($text=~/further instruction/i) {
    quest::say("It is one thing to destroy the artificial life of a clockwork. It is another thing entirely to claim the life of another gnome. There is a member of the Dark Reflection. Yulcabis. who has been assigned to a task in the Steamfont Mountains. He has failed repeatedly in the tasks assigned to him in the past and has become a burden to the Dark Reflection. Find Yulcabis and slay him. Return to me with the weapon he carries.");
  }
  if($text=~/armor/i) {
    quest::say("Armor? For a warrior? Oh yes. You'll need to speak with Windlebeck for that.");
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
  if(plugin::check_handin(\%itemcount, 10990 => 1)) { #Yulcabis's axe
    quest::say("Excellent work. Now that we no longer have to bother with Yulcabis, I suppose we can discuss your progression as a member of the Dark Reflection. You'll need some [armor], though.");
    quest::summonitem(11077); #plague warrior battle axe
    quest::exp(100);
    quest::faction(115,-10); #gem choppers
    quest::faction(71,3); #dark reflection
    quest::faction(91,-10); #eldritch collective
    quest::faction(176,-10); #King ak'anon
    quest::faction(209,3); #meldrath
  }
	elsif (plugin::check_handin(\%itemcount, 18759 => 1)) { # Stained Parchment
		quest::say("This is fabulous news!! You have done well, young one. Once you are ready for [further instruction] please let me know, I will guide you through your early and most dangerous days. When you have become more experienced in our art, I will be able to further train you, both in our art as well as in some of the various [trades] you will have available to you. ");
		quest::summonitem(13518); # Tin Patched Tunic*
		quest::ding();
		quest::faction(71,10); #Dark Reflection
		quest::faction(91,-15); #Eldritch Collective
		quest::faction(115,-15); #Gem Choppers
		quest::faction(76,-15); #Deepmuses
    quest::exp(100);
	}
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:akanon  ID:55157 -- Naygog_Mitope