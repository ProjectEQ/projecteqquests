sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18790)) { 
		$client->Message(15,"As your eyes adjust to the darkness, a large troll decked out in grimy metal armor turns towards you. 'I be Ranjor. You look weak now but mebbe me can make you strong! You read note in inventory and hand to me to start training!'";
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Ya wanna be a member a Da Bashers. duz ya?  What making ya tink yooz is good nuff ta be one o' us?  Can ya proves ta me why I shouldn't oughtta just eat yer smelly hide?  I gonna tests ya. ya big. ugly peece o' meet.  Ya [willin ta test] or duz I just eats ya now?"); 
	}
	if($text=~/test/i){
		quest::say("Stoopid meat.  I gonna eats ya anyways sumday.  Brings me a froglok meat and two dem li'l froglok tadpole fleshes.  Dey berry good."); 
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount,18790 => 1)){  #Tattered Note
		quest::say("Arhh.. Ranjor mighty warrior.. Ranjor teach you warrior.. you fight for Ranjor now.");
		quest::ding();
		quest::summonitem(13528);  #Mud Covered Tunic
		quest::faction(66,5);  #Da Basher
		quest::faction(22,-10);  #Broken Skull Clan
		quest::exp(100); 
	}
	if (plugin::check_handin(\%itemcount, 5014 => 2, $gold >= 2)) {#correct text needed
		quest::say("Raar.. Ranjor give yous a good weapon...");
		quest::summonitem(quest::ChooseRandom(94201, 6022, 6025, 7014, 5026));
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:grobb  ID:40024 -- Ranjor 

