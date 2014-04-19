sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class eq "Paladin")) { 
		$client->Message(15,"Datur Nightseer glances your way. 'Ah a new recruit! Welcome, young one! Read the note in your inventory and then hand it to me when you wish to begin your training!'");
  }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 18768 => 1)) {
		quest::say("Welcome, we are the Paladins of the Underfoot. I am Datur, and I will help teach you the word and will of the Duke of Below, Brell Serilis. Here is our guild tunic. Let's get started, shall we?");
      quest::summonitem(13514);
      quest::faction(44,100); # Clerics of Underfoot
      quest::faction(169,100); # Kazon Stormhammer
      quest::faction(219,75); # Miners Guild 249
   }
   if (($faction <= 4) && (plugin::check_handin(\%itemcount, 12279 => 1))) {
      quest::say("The chalice is returned!! Praise be to Brell!! You have proven yourself to our church and have earned our respect. Let me welcome you into our brotherhood with the Cape of Underfoot. Wear it with pride as all of our finest paladins do.");
      quest::faction(44, 25);
      quest::faction(169, 25);
      quest::faction(219, 25);
      quest::exp(250);
      quest::givecash(0, 0, 0, 3);
      quest::summonitem(12281);
   }
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Paladin');

   plugin::return_items(\%itemcount);
}

#END of FILE Zone:kaladimb  ID:67029 -- Datur_Nightseer