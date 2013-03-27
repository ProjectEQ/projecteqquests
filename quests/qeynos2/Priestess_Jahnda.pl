sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18714)) { 
		$client->Message(15,"As you get your bearings, a healing energy seems to sweep over you and an almost etheral voice seems to echo in your mind. 'Welcome young cleric of Rodcet. I am Priestess Jahnda. Read the note in your inventory and hand it to me to begin your training.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::say("Welcome to the Temple of Life. where the will of Rodcet Nife, the Prime Healer, is carried out.  I am the High Priestess Jahnda.  If you require any training in our ways. please talk to any of our priests or any of the paladins of the Temple of Life.");
	}
	if($text=~/blessed oil/i) {
		quest::say("I do not distribute the blessed oil of life. Please speak with Nomsoe Jusagta. Tell Nomsoe that Brother Estle needs the blessed oil.");
	}
	if($text=~/hayle mool/i) {
		quest::say("Brother Hayle Mool is one of our finest clerics. He could convert anyone to the ways of Rodcet Nife. Recently, he has been out in the [Plains of Karana] trying to befriend the [Splitpaw clan]. I pray he has not become their prisoner or even worse, their dinner.");
	}
	if($text=~/paw/i) {
		quest::say("Paw is a gnoll burrow. It is said to be located somewhere in the Plains of Karana. The gnolls of this burrow is rarely seen. The fur of these gnolls is white, unlike their brothers in Blackburrow.");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18714 => 1)) { #Tattered Note
		quest::say("Welcome to the Temple of Life. I am Jahnda. the High Priestess of the Clerics of Nife. Wear this tunic with pride and carry out the will of Nife. Please. see Tonmerk Plorsin or Nomsoe Jusagta. They will help get you started spreading the will of The Prime Healer.");
		quest::summonitem(13506); #Faded Tunic*
		quest::ding();
		quest::faction(257,10); #Priest of Life
		quest::faction(183,10); #Knight of Thunder
		quest::faction(135,10); #Guards of Qeynos
		quest::faction(21,-15); #Bloodsabers
		quest::faction(9,10); #Antonius Bayle
		quest::exp(100);
	}
	if(plugin::check_handin(\%itemcount, 13911 => 1)) {
		quest::say("Oh my word!! This is terrible news. This belongs to Hayle Mool. He has been captured by the Splitpaw Clan while in Karana. You must go to his aid. We cannot do so at this time. Here. Be sure to hand him this summons. I will need to speak with him.");
		quest::summonitem(18927);
	}
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos2  ID:2069 -- Priestess_Jahnda