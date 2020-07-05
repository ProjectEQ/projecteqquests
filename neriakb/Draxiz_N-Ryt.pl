#Draxiz N-Ryt.pl
#Part of Innoruuk Disciple
# items: 12807, 2284, 18957

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 12807 => 1)){#Halfling Druid Master's Head
		quest::say("I have foreseen your arrival, $name. I see from the mind of this lesser creature you have slain that he was receiving orders from beyond the boundaries of Nektulos. I see an armored Leatherfoot moving cautiously through the commonlands attempting to avoid the eyes of travelers and guard posts. Find this Leatherfoot I see in my visions and return any pertinent information he may be carrying to me so that I may decipher it. I have skinned the face of this druid and enchanted it so that you may learn what you must through your skills of subterfuge. Go now, $name, and do not disappoint me!");
		quest::summonitem(2284);#Skinned Halfling Face Mask
		quest::faction(239, -30);#The Dead
		quest::faction(363, 10);#The Spurned
	}
	elsif(plugin::check_handin(\%itemcount, 18957 => 1)){#Leatherfoot Raider Orders
		quest::say("I see you are more cunning than you appear, $name. These orders to Whoopal bring disturbing news indeed. It seems there is a Leatherfoot spy somewhere in Neriak who has been providing the raiders with information. Find this spy and return his head and your initiate holy symbol of Innoruuk to Ithvol and if he deems you worthy he will promote you within the ranks of the Spires.");
		#Got this loc from in game, using the description and picture from illia's -Kilelen
		quest::unique_spawn(41104,0,0,-560,-180,-55); # NPC: #a_leatherfoot_spy
		quest::faction(239, -30);#The Dead
		quest::faction(363, 10);#The Spurned
	}
  	plugin::return_items(\%itemcount);
}#Done
