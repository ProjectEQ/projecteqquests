sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18719)) { 
		$client->Message(15,"As you glance about the crowded room, Kinloc Flamepaw greets you. 'Why hello there. Are you perhaps a new recruits? If you wish to learn the ways of the Magician, read the note in your inventory and hand me your note to start your training.'");
  }
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18719 => 1)){ #Tattered Note
		quest::say("Welcome to the Order of Three. I am Kinloc, Guild Master of the Magicians. This tunic of the Order is for you, wear it with honour. Study hard and master your skills, and you will become an important part of our Order. Yestura shall help introduce you to the ways of magic.");
		quest::summonitem(13543); #Used Blue Robe*
		quest::ding();
		quest::faction(240,10); #Order of Three
		quest::faction(21,-15); #Bloodsabers
		quest::faction(135,10); #Guards of Qeynos
		quest::faction(235,-15); #Opal Dark Briar
		quest::exp(100); 
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos  ID:1130 -- Kinloc_Flamepaw