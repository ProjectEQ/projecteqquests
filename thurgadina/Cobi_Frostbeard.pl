# Quest for Cobi Frostbeard in Thurgadin - Druid Velious Armor (Rowyls) 
# Kiladiveus - copied text from website. created Sub EVENT_SAY and Sub EVENT_ITEM for quest. Used Faction requirement method.
# items: 25805, 24942, 31050, 25815, 24944, 31051, 25827, 24943, 31054, 25840, 24948, 31053, 25841, 24947, 31049, 25836, 24946, 31052, 25838, 24945, 31055


sub EVENT_SAY { 
  if ($faction <= 3) { # Require warmly and greater faction    
	if($text=~/hail/i){ 
		quest::say("Greetings to you. I seek one who calls himself a druid. What do you call yourself, manling?");
	} 
	if($text=~/druid/i){
		quest::say("Good. I had hoped you were one. As nature's guardian, you fight the never-ending struggle against those who seek to defile it. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings, and boots.");
	} 
	if($text=~/tunic/i){  
		quest::say("If you find an eroded leather tunic and three pieces of black marble bring them to me and I shall attempt to create an enchanted tunic that will serve you well.");
	}
	if($text=~/cap/i){  
		quest::say("Those who are as wise as we are know that protection of the head is most important. I may be able to forge you something most interesting if you were to bring me three pieces of crushed onyx sapphire and an eroded leather cap."); 
	}
	if($text=~/sleeves/i){ 
		quest::say("Three jaundice gems and a set of eroded leather sleeves might be an interesting combination. The powers of the gems may be harvested to imbue the sleeves.");
	}
	if($text=~/gloves/i){ 
		quest::say("Strong protection for one's hands is important. I may be able to craft you a set of powerful leather gloves if you find a set of eroded leather gloves and three crushed lava rubies."); 
	}
	if($text=~/bracers/i){ 
		quest::say("Bracers are quite easy to imbue. Simply find three crushed opals and an eroded leather bracer and I will complete the ritual to enchant them."); 
	}
	if($text=~/leggings/i){ 
		quest::say("Leggings are a bit trickier to imbue. Three chipped onyx sapphires will allow me to channel the correct energies into a pair of eroded leather leggings. However, those chipped onyx sapphires are somewhat rare. Return to me if you find such things in your journeys."); 
	}
	if($text=~/boots/i){ 
		quest::say("Simply bring me a set of three crushed flame emeralds and a pair of eroded leather boots and I will imbue them. I bid you good luck in finding such things.");
	}
  } 
  else { 
   	quest::say("I do not know you well enough to entrust you with such a quest, yet."); 
  } 
} 




sub EVENT_ITEM { 
  if ($faction <= 3) { # Require warmly and greater faction 
	if (plugin::check_handin(\%itemcount, 25805 => 3, 24942 => 1)) { # tunic - 
		quest::summonitem(31050); # Item: Rowyl's Chestguard of Nature
		quest::exp(100000); 
		quest::faction(406,20); # coldain 
		quest::faction(405,20); # Dain Frostreaver IV 
		quest::faction(419,-60); # Kromrif
                quest::faction(448,-60); # Kromzek 
		quest::emote("smiles warmly as he hands you your reward.");
		quest::say("You have done well."); 
	} 
	elsif (plugin::check_handin(\%itemcount, 25815 => 3, 24944 => 1)) { # sleeves 
		quest::summonitem(31051); # Item: Rowyl's Vambraces of Nature
		quest::exp(100000); 
		quest::faction(406,20); # coldain 
		quest::faction(405,20); # Dain Frostreaver IV 
		quest::faction(419,-60); # Kromrif
                quest::faction(448,-60); # Kromzek 
		quest::emote("smiles warmly as he hands you your reward.");
		quest::say("You have done well.");     
	} 
	elsif (plugin::check_handin(\%itemcount, 25827 => 3, 24943 => 1)) { # leggings 
		quest::summonitem(31054); # Item: Rowyl's Greaves of Nature
   		quest::exp(100000); 
  		quest::faction(406,20); # coldain 
		quest::faction(405,20); # Dain Frostreaver IV 
		quest::faction(419,-60); # Kromrif
                quest::faction(448,-60); # Kromzek 
		quest::emote("smiles warmly as he hands you your reward.");
		quest::say("You have done well."); 
	} 
	elsif (plugin::check_handin(\%itemcount, 25840 => 3, 24948 => 1)) { # gloves 
		quest::summonitem(31053); # Item: Rowyl's Gauntlets of Nature
		quest::exp(100000); 
		quest::faction(406,20); # coldain 
		quest::faction(405,20); # Dain Frostreaver IV 
		quest::faction(419,-60); # Kromrif
                quest::faction(448,-60); # Kromzek 
		quest::emote("smiles warmly as he hands you your reward.");
		quest::say("You have done well.");  
	} 
	elsif (plugin::check_handin(\%itemcount, 25841 => 3, 24947 => 1)) { # cap 	
		quest::summonitem(31049); # Item: Rowyl's Circlet of Nature
		quest::exp(100000); 
		quest::faction(406,20); # coldain 
		quest::faction(405,20); # Dain Frostreaver IV 
		quest::faction(419,-60); # Kromrif
                quest::faction(448,-60); # Kromzek 
		quest::emote("smiles warmly as he hands you your reward.");
		quest::say("You have done well."); 
	} 
	elsif (plugin::check_handin(\%itemcount, 25836 => 3, 24946 => 1)) { # bracers 
		quest::summonitem(31052); # Item: Rowyl's Bracer of Nature
		quest::exp(100000); 
		quest::faction(406,20); # coldain 
		quest::faction(405,20); # Dain Frostreaver IV 
		quest::faction(419,-60); # Kromrif
                quest::faction(448,-60); # Kromzek 
		quest::emote("smiles warmly as he hands you your reward.");
		quest::say("You have done well."); 
	} 
	elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24945 => 1)) { # boots 
   		quest::summonitem(31055); # Item: Rowyl's Boots of Nature
   		quest::exp(100000); 
   		quest::faction(406,20); # coldain 
   		quest::faction(405,20); # Dain Frostreaver IV 
   		quest::faction(419,-60); # Kromrif
                quest::faction(448,-60); # Kromzek 
		quest::emote("smiles warmly as he hands you your reward.");
   		quest::say("You have done well."); 
    	} 
  	else { 
   		quest::say("These are not the pieces I need."); 
  	} 
  }
  plugin::return_items(\%itemcount); 
} 

#END of FILE Zone:thurgadina  ID:115218 & 115150 -- Cobi_Frostbeard
