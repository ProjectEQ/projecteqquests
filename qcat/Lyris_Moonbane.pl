# items: 18721, 13552
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18721)) { 
		$client->Message(15,"As you orient yourself amongst the filth and decay of the catacombs, a menacing figure turns to address you. 'I am Lyris Moonbane. Should you wish to dedicate your pathetic life to the way of Bertoxxulous and learn the ways of the Necromancer, read the note in your inventory and hand it to me to begin your training.'");
  }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18721 => 1)) { #Blood Stained Note
		quest::say("So, you wish to to walk with the dead, eh? The army of the Plaguebringer is quietly amassing its diseased soldiers in the shadows and sewers of Norrath. Go to Brother Bruax. He will turn you into something useful, I hope.");
		quest::summonitem(13552); #Dark Stained Purple Robe*
		quest::ding();
		quest::faction(221,100); #Bloodsabers
		quest::faction(262,-15); #Guards of Qeynos
		quest::faction(296,10); #Opal Dark Briar
		quest::faction(341,-25); #Priest of Life
		quest::faction(230,5); #Corrupt Qeynos Guards
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}
