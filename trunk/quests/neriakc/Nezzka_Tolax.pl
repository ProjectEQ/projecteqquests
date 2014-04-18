sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18757)) { 
		$client->Message(15,"Nezzka Tolax turns towards you. 'Welcome to the Lodge of the Dead. I am Nezzka Tolax and with my training you will learn to master teh ways of the Shadowknight. Read the note in your inventory and hand it to me when you are ready to begin your training.'");
  }
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18757 => 1)) { #tattered note
		quest::say("Hmmm, I hope you're tougher than you look. Here, put this on. Go find Ulraz, he'll beat you into shape. There's no turning back now, punk. So, you'd better do well, got it?");
		quest::ding();
		quest::summonitem(13586); #Black Training Tunic
		quest::faction(322,100); #The Dead
		quest::faction(268,15); #Queen Cristanos Thex
		quest::faction(177,-15); #King Naythox Thex
		quest::faction(170,-15); #Keeper of the Art
		quest::faction(91,-15); #Eldritch Collective
		quest::faction(260,-200); #Primodial Malice
		quest::exp(100);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:neriakc  ID:42069 -- Nezzka_Tolax