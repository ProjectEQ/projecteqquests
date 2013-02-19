sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18849)) { 
		$client->Message(15,"As you attempt to get your bearings, a noble looking Vah Shir turns towards you. 'The animal instinct is strong in you my, friend. I am Elder Animist Sahdi. Read the note in your inventory and then hand it to me to begin your training.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Greetings $name. are you one of our new recruits?"); 
	}
	if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
		quest::say("Luckily for you someone found it.");
		quest::summonitem(2873);
	}
	if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
		quest::say("Someone found a rockhopper chewing on this in the pit. Try not to lose it this time.");
		quest::summonitem(2878);
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18849 => 1)) { # Khati Sha Guild Summons
		quest::say("$name. welcome to the Animist's guild. You have grown strong in the safety of our city and it is now time for you to register for official citizenship of Shar Vahl. The Khati Sha. explorers of this hostile land. have granted your request of inclusion and deem you to be worthy of our training. Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
		quest::setglobal("Shar_Vahl_Cit",1,5,"F");
		quest::summonitem(2873); # Application for Citizenship
		quest::ding();
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
		quest::say("Allow me to be the first to welcome you to the Khati Sha. lords of the beasts. Accept this cloak. young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Animist Poren and he will give you instruction. May the spirits of the beasts guide you and keep you safe.");
		quest::setglobal("Shar_Vahl_Cit",7,5,"F");
		quest::summonitem(2878);
		quest::ding();
		quest::exp(100);
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
	}
	plugin::return_items(\%itemcount);
}
