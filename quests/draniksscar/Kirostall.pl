#Kirostall.pl
#Revenge on the Ikaav, Revenge on the Kyv, Revenge on the Noc
#Must be warmly+ to do these. -Kilelen

sub EVENT_SAY
{	
	if ($faction <= 2) {
		if ($text=~/Hail/i) {
			quest::say("Ah, there you are! I've wanted to meet you. After hearing about your fights with the Muramites I knew that you were one to respect. At least you have the heart to fight back against those worthless thieves. If it were up to my kinsmen we'd all just roll over and thank them for ruining our world. After the battles you've been through I wonder if you could take care of a few [things] for me.");
		}	
	
		if ($text=~/things/i) {
			quest::say("You see, I've been keeping my eyes open. I'm not one to just roll over and take what's given to me. I keep watch over those Muramites and what goes on in their ranks. I've noticed [three] of the Muramites in particular who seem to have a bit more sway in the legion than a common soldier. Perhaps if you could see that these Muramites had a bit of an accident, the rest of the dragorn would come to their senses and see that the Muramites are nothing more than a pathetic band of slavers.");
		}
	
		if ($text=~/three/i) {
			quest::say("'The first one that I noticed was [Bowlord Rorn]. He's one of those kyv that you see around in the Muramite ranks. I watched Rorn for a while and noticed he worked with [Mistress Ujani] a good deal. Then, a few weeks later while hiding from some ukun, I came across [Guttertusk the Cruel]. He's a mean one he is. I wouldn't put anything past him and would prefer it if I didn't have to cross his path again.");
		}
		
		if ($text=~/Bowlord Rorn/i) {
			quest::say("As I said, Bowlord Rorn is one of those kyv. He's been keeping track of their patrols and what sorts of tasks they have been set on. If you could bring me the decorated gauntlets he's always wearing and three of the bows his fellow kyv carry it would help my efforts greatly.");
		}
		
		if ($text=~/Guttertusk the Cruel/i) {
			quest::say("I shudder every time I think about him. I can't even tell you the tales I heard of his deeds. Aside from the good it would do my cause, his death would be a great relief to my people. As reluctant as they may be to rise against the oppression, no one deserves that sort of treatment. Bring me Guttertusk's helm and the hides from three of his fellow noc and you shall have stories told of your deeds for all time.");
		}
		
		if ($text=~/Mistress Ujani/i) {
			quest::say("Mistress Ujani is a one of the ikaav. As you may know, ikaav have more than a bit of talent when it comes to magic and Ujani is no exception. She likes to dominate those around her with her charm and trance spells. I would hate to fall under her spell even for a moment. If you could kill her for me and bring me her magical amulet and a scrap of skin from three of her fellow ikaav it would be a boon to the dragorn of the city.");
		}
	}
}

sub EVENT_ITEM
{
	if ($faction <= 2) {
		#Revenge on the Ikaav
		if(plugin::check_handin(\%itemcount, 36532 => 3, 36531 => 1,)) {#3x Scrap of Ikaav Skin, Ujani's Amulet
			quest::say("Outstanding!  Take this!");#text made up
			quest::faction(410, 10);#Dranik Loyalists
			quest::faction(432, -20);#Overlord Mata Muram
			quest::exp(10000);
			#Reward depends on class
			if (($class eq "Wizard") || ($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) {
				quest::summonitem(71153);#Ancient Ivory Figurine
			}
			else {
				quest::summonitem(71154);#Polished Runestone
			}
		}
		#Revenge on the Kyv
		elsif(plugin::check_handin(\%itemcount, 36530 => 3, 36529 => 1)) {#3x Broken Kyv Bow, Elaborate Gauntlets
			quest::say("Perfect! This will light a fire under those laggards. Here, take this ring I found in the gauntlets. It appears you were a bit tough on him when you pulled these off. Good for you!");
			quest::faction(410, 10);#Dranik Loyalists
			quest::faction(432, -20);#Overlord Mata Muram
			quest::exp(10000);
			#Reward depends on class
			if (($class eq "Wizard") || ($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) {
				quest::summonitem(71148);#Muramite Glyphed Ring
			}
			else {
				quest::summonitem(71147);#Muramite Officer's Ring
			}
		}
		#Revenge on the Noc
		elsif(plugin::check_handin(\%itemcount, 36534 => 3, 36533 => 1)) {#3x Noc Hide, Blood Encrusted Helm
			quest::say("Superb!  Take this!");#Text made up
			quest::faction(410, 10);#Dranik Loyalists
			quest::faction(432, -20);#Overlord Mata Muram
			quest::exp(10000);
			#Reward depends on class
			if (($class eq "Wizard") || ($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) {
				quest::summonitem(71150);#Diamond Earring of the Victor
			}
			else {
				quest::summonitem(71149);#Forged Hoop of Gratitude
			}
		}
	}
	plugin::return_items(\%itemcount); #return items if not the ones required
}#END of FILE Zone:draniksscar ID:302046 --Kirostall.pl