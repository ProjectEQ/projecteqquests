sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18727)) { 
		$client->Message(15,"Ghanlin Skyphire, a stern and powerful looking man looks your way, 'What is this? An apprentice wizard in our ranks? If so, then read the note in your inventory and hand it to me to start your training. With my help you will start on the path to becoming a great and powerful wizard if that be your will.'");
  }
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18727 => 1)) { # Tattered Note
		quest::say("Greetings. I am Ghanlin Skyphire, Master Wizard of the Crimson Hands. All of us here have devoted our lives to the studies of the arcane and mystical. Let's get you started. Here's your training robe.  Now, go find Raskena. She'll help train you and give you your first lesson.");
		quest::summonitem(13550); #Old Used Robe*
		quest::ding();
		quest::faction(60,10);   #Crimson Hands
		quest::faction(145,10);  #High Council of Erudin
		quest::faction(143,-15); #Heretics
		quest::faction(147,10);  #High Guard of Erudin		
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:erudnint  ID:24040 -- Ghanlin_Skyphire