sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18551)) { 
		$client->Message(15,"As you attempt to get your bearings, a powerful looking Vah Shir turns towards you. 'I am Elder Spiritist Grawleh, your Guild Master. Read the note in your inventory and then hand it to me and we will begin your training in the ways of the Shaman.'");
  }
}

sub EVENT_SAY { 
	if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
		quest::say("Luckily for you someone found it.");
		quest::summonitem(2873);
	}
	if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
		quest::say("Someone found a grimling wearing this in the pit. Try not to lose it this time.");
		quest::summonitem(2878);
	}
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::say("I know many of the taverns and eateries have their own barrels, but you may want to try Jakhal and Kahala's Brewery. You can find it in the southwestern section of the Merchant's Quarter, or Corridor of Heroes, as I like to call it..");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount,30962 => 1)){
		quest::summonitem("15225","1");
	}
	elsif(plugin::check_handin(\%itemcount,18551 => 1)){ # Dar Khura Guild Summons
		quest::say("Good $name, I am honored to meet you. You have come of age and it is time for you to register for citzenship of Shar Vahl. The Dar Khura, spiritual guides of our people, have sensed your spirit and deem you to be worthy of our training. First things first, take this application to Registrar Bindarah and return to me with proof of citzenship.");
		quest::say("I know that you may be nervous right now... after all, this should be very exciting first step for you. If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions. They will most likely know where to find the place or person that you are looking for.");
		quest::setglobal("Shar_Vahl_Cit",1,5,"F");
		quest::summonitem(2873); # Application for Citizenship
		quest::ding();
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
		quest::say("Welcome back, $name! I see that your documents are in order and you are an official citizen of Shar Vahl, which is great news! Let me be the first to welcome you to the ranks of the Dar Khura! Here, take this cloak and wear it with pride.");
		quest::say("Present your acrylia slate to spiritist Fehril and he will guide you through your early training. May the strongest of our ancestral spirits be your inspiration.");
		quest::summonitem(2878);
		quest::setglobal("Shar_Vahl_Cit",7,5,"F");
		quest::ding();
		quest::exp(100);
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
		plugin::return_items(\%itemcount);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155167 -- Elder_Spiritist_Grawleh 
