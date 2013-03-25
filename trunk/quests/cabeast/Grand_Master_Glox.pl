sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18204)) { 
		$client->Message(15,"As you enter the Court of Pain, Grand Master Glox, sits in mediation. Without even looking up, he addresses you. 'The time has come for discipline. Read the note in your inventory and then hand it to me to begin your training.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i){
		quest::emote('shows no reaction to your greeting.');
	}
	if($text=~/trial of agility/i){
		quest::say('I knew you were not the whiff others claimed you to be, are you sure you are [ready] to be tested in agility?');
	}
	if($text=~/ready/i){
		quest::say('We shall spar then, I hope you are as prepared as you think you are.');
		quest::movepc(106,-190.9,1089.8,-25.2);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18204 => 1)){ # Guild Summons
		quest::emote('breaks his meditation and quickly grabs your forearms. You feel the raw power in his heavily callused hands. Out of nowhere, his tail sweeps forward and places a shackle upon your wrist. He then points south towards Master Bain and returns to his meditation.');
		quest::summonitem(4190); # Shackle of Dust
		quest::ding();
		quest::faction(317,10); #Swift Tails
		quest::faction(193,10); #Legion of Cabilis
		quest::exp(100)
	}
	elsif (plugin::check_handin(\%itemcount, 14788 =>1 )) {
		quest::emote("sits whispering incoherently for a long moment before even regarding the note you dropped in front of him. The Grand Master suddenly snatches up the note from Xlixinar, removes a small charcoal marker from a belt pouch, and scrawls some intructions upon it. He drops the note immediately after finishing and resumes his meditation without a word.");
		quest::summonitem(18980);
	}
	elsif (plugin::check_handin(\%itemcount, 14782 =>1, 10032 =>1 )) {
		quest::emote("nods slightly");
		quest::summonitem(14783);
		quest::ding();
		quest::exp(10000);
	}
	plugin::try_tome_handins(\%itemcount, $class, 'Monk');
	plugin::return_items(\%itemcount);
}

 #END of FILE : Zone : cabeast : NPC_ID : 2023 : Grand_Master_Glox
