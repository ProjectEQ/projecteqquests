sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18846)) { 
		$client->Message(15,"You stand in a large alcove. Next to you is a huge Ogre, scarred from many a battle. 'You come for training? You will be strong and fight like animal! I am Bordag. I train you! Read note in inventory and hand to me when ready to start!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18846 =>1)) { #A tattered note
    quest::say("You strong and mean like bear!  You wear bear fur so all know you beastlord o' da Feerrott!  Talk to Grapok and get to work!"); 
    quest::summonitem(13575); #Bear Fur Tunic
		quest::ding();
		quest::faction(295,15); # Shaman of War
		quest::exp(100);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
  plugin::return_items(\%itemcount);
}

