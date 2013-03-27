sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18728)) { 
		$client->Message(15,"Markus Jaevins tells you, 'Welcome to the Tower of the Gate Callers, I am Markus Jaevins. Please read the note in your inventory and hand it to me when you are ready to start learning the ways of the Magician.'");
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I am the overseer of the great city of Erudin. You will address me in proper manner. HAIL!!");
  }
  if ($text=~/crime/i) {
    quest::say("Oh, yes. We here in Erudin have no crime. Actually, it is a very low crime rate. Most of those crimes are committed by the defective brains of [heretics] or inferior, non-Erudite races.");
  }
  if ($text=~/heretics/i) {
    quest::say("The heretics are our sworn enemies. Their ancient origins are our own, however, they are the mad Erudites who chose the dark side of magic called necromancy. We, the magicians, caught one snooping in the palace just last week. He is now our [prisoner].");
  }
  if ($text=~/prisoner/i) {
    quest::say("The infidel was memorizing our spells to take to the rest of the heretic scum. He will finally be [purged] today. Could you please go to the cells here in the palace and ask Jail Master Lius to give you the heretic's remains?");
  }
  if ($text=~/purged/i) {
    quest::say("To be purged is to take all the evil from ones body and set your soul free. Through magical means, the Erudite Cleansers pull the accused's organs out through the mouth. When all is done, you can be assured the body is cleansed of all evil.");
  }
  if ($text=~/the heretic has escaped/i) {
    quest::say("Escaped!! This is not good. The sentinels will not find him in time. You must find him. When you find him, release his soul and rid his body of evil any way you can. Bring me proof and all will be well.");
  }
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18728 => 1)) { # Tattered Note
		quest::say("Welcome. young one! I see you show interest in the circle of magic. Nowhere upon Norrath will you find a greater school than this - the Gatecallers. You shall wear this tunic as a sign that you have begun the training of this circle. Remember. the power of the Gatecaller is the power of summoning. Go find Vasile. he will help teach you the basics of summoning. Good luck, friend!");
		quest::summonitem(13548); # Old Torn Robe*
		quest::ding();
		quest::faction(112,10); #gate callers
		quest::faction(147,10); #high guard of erudin
		quest::faction(145,10); #high council of erudin
		quest::faction(143,-15); #heretics
		quest::exp(100);
	} 
	if (plugin::check_handin(\%itemcount, 13128=> 1)) {
		quest::say("This is fine work, young one. You keep this up and you shall be knighted before long.");
		quest::exp(2500);
		quest::faction(112,10); #gate callers
		quest::faction(147,10); #high guard of erudin
		quest::faction(145,10); #high council of erudin
		quest::faction(143,-30); #heretics
	}
	plugin::return_items(\%itemcount);
}

# EOF zone: erudnint ID: 23037 npc: Markus_Jaevins