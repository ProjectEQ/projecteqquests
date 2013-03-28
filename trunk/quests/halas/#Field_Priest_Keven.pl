sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18847)) { 
		$client->Message(15,"Field Priest Keven turns towards you. 'There you are. I have been waiting for you. Are you ready to begin your training? With my help you will be able to command a great beast to become your most trusted companion. Read the note in your inventory and hand it to me when you are ready to begin your training.'");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18847 =>1)) {     # Tattered note
    quest::say("Welcome $name! The blood of our brothers the wolves run strong through your veins. You must learn to control your spiritual link with our canine brothers. Wear this tunic so that others may recognize you as a Field Priest of the Tribunal, the claws and fangs of justice! Talk to my friend Hoyce and he can get you started.");
    quest::ding();
    quest::faction(294, 5);   # Shamen of Justice
    quest::faction(213, 5);   # Merchants of Halas
    quest::faction(33, -3);   # Circle Of Unseen Hands
    quest::faction(48, -3); 	# Coalition of Tradefolk Underground
    quest::faction(90, -3); 	# Ebon Mask
    quest::summonitem(13574);   # Soiled Gray Tunic
    quest::exp(100);        	# Give exp for turning in quest
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
  plugin::return_items(\%itemcount);
}
