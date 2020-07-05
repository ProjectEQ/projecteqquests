# items: 1724, 1713, 1709, 1710, 1712, 1714, 1722, 1720, 1723
sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("You obviously have no idea where you have trespassed so I will generously allow you to live. I suggest you leave immediately before my generosity runs out however......Unless, you're looking for work.");
	}
	if ($text=~/looking for work/i) {
		quest::say("Well, you might do. Out in the deepest scar, known as the Wakening Land we have deployed several mercenaries to harass the local annoying population. They are in need of constant supplies so we hire those we can trust to deliver those supplies to the mercenaries wandering out in the field. Are you interested, $race?");
	}
	if ($text=~/i am interested/i) {
		quest::say("Very well. Take this pack of supplies to any of the Mercenaries you come across in the field. They will pay you upon delivery. Return here for more supplies to deliver when you are ready.");
		quest::summonitem(1724); # Item: Field Supplies
	}
	if ($text=~/plane of growth/i) {
		quest::say("Our soldiers fell victim to the denizens of that plane and unless we can find some way to stop this from happening, the land of Wakening will never be under our control. Many have suggested just destroying the Nexus but they are short-sighted fools. My vision is not only to control the resources that forest provides, but also to control the very force of Growth itself! You will help me to do this, mercenary.");
	}
	if ($text=~/how will i help you/i) {
		quest::say("The tablet I have given you is inscribed with runes of binding. I am owed a favor and it has come time to use it. There is a venerable sea turtle that lives along the warmer part of the coast, where the ice floes begin to break up. His name is Corudoth. Find him and speak with him. Remind him of his obligation to me and if he is not forthcoming in his answers, tell him he owes me. Then show him the tablet. He will tell you what to do. He will most likely be beneath the ocean.  The mask I gave you should help.");
		quest::summonitem(1713); # Enchanted Velium Mask
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 1709 => 1)) { # Report of Failure
		quest::emote("takes the report from you and places it in a pocket without even glancing at it. He says, 'Do not worry, $name. I know of the planar creatures who eliminated my troops. The fault is not yours but of that fool Drioc's. The Savage land is not just a simple forest as those idiots in the field believe. It is a cradle of life and the forces that drive it. Within that forest is a nexus, a gateway to another plane of existence, the Plane of Growth.'");
		quest::ding();
		quest::faction(448,10); # Faction: Kromzek
		quest::faction(419,10); # Faction: Kromrif
		quest::faction(429,10); # Faction: King Tormax
		quest::faction(430,-30); # Faction: Claws of Veeshan
		quest::exp(1000);
		quest::summonitem(1710); # inscribed velium tablet
	}
	if(plugin::check_handin(\%itemcount, 1712 => 1, 1714 => 1)) { # Arcanum of Roth, Ancient Rusted Key *NOTE* Petcas no longer drops the key --  This might of changed with the warrior 1.5 epic prequest which involves Petcas.
		quest::say("Ahhh, you suprise me mercenary. You have found the book as well as the key to open it. I must begin my research as soon as possible. But first, your reward. With this voucher you can receive 1 of the 3 treasures I will offer you. If given to Kellek you will receive an item worthy of a hearty and rugged combatant. If given to Wenglawks you will aquire an item to be worn by only the most pious. And if given to me I will give you a sorcerous trinket of my own design.");
		quest::ding();
		quest::faction(448,10); # Faction: Kromzek
		quest::faction(419,10); # Faction: Kromrif
		quest::faction(429,10); # Faction: King Tormax
		quest::faction(430,-30); # Faction: Claws of Veeshan
		quest::exp(2000);
		quest::summonitem(1722); # Helssen's Voucher
	}
	if(plugin::check_handin(\%itemcount, 1722 => 1)){ #Helssen's Voucher
		quest::say("Excellent choice, $race. Competence and a sense of style. When we are ready to take the Wakening I will most definitely welcome your participation. Here is your reward.");
		quest::ding();
		quest::summonitem(1720); # Helssen's Prismatic Trinket
		quest::summonitem(1723); # Noble's Seal
		quest::exp(2000);
  }	
	plugin::return_items(\%itemcount);
}

# EOF zone: kael ID: 113108 NPC: Noble_Helssen

