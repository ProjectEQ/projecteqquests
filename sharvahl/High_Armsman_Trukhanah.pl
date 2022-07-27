# items: 2873, 2878, 18553, 2897
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18553)) { 
		$client->Message(15,"As you attempt to get your bearings, a powerful looking Vah Shir turns towards you. 'I am High Armsman Trukhanah, your Guild Master. Read the note in your inventory and then hand it to me and we will begin your training in the ways of the Warrior.'");
  }
}

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Well met. friend.  May I be of assistance?");
	}
	if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
		quest::say("Luckily for you someone found it.");
		quest::summonitem(2873); # Item: Application for Citizenship
	}
	if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
		quest::say("Someone found this stuck in the top of a palm tree in the center of the plaza. I don't even want to know how it got there, just try not to lose it this time.");
		quest::summonitem(2878); # Item: Initiate's Cloak of Shar Vahl
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18553 => 1)) { # Khala Dun Guild Summons
		quest::say("Good $name. I am pleased to see you. You have come of age and it is time for you to register as a citizen of Shar Vahl. Your invitation indicates that the Khala Dun. defenders of our society. have noticed you and consider your potential to be worthy of our training. First. take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
		quest::summonitem(2873); # Application for Citizenship
		quest::setglobal("Shar_Vahl_Cit",1,5,"F");
		quest::ding();
		quest::exp(20);
	} 
	elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
		quest::say("Congratulations $name! Welcome to your new life as an official citizen of Shar Vahl. This cloak symbolizes your commitment to serving this people through continuous self-improvement. For now, you must strenghten yourself until you become worthy to train in the way of the Khala Dun. Show your acylia slate to Guard Hebijeb. He will direct you further. May the spirits of our ancestors be your guide.");
		quest::setglobal("Shar_Vahl_Cit",7,5,"F");
		quest::summonitem(2878); # Item: Initiate's Cloak of Shar Vahl
		quest::ding();
		quest::exp(450);
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155170 -- High_Armsman_Trukhanah
