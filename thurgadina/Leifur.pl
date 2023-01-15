# Quest for Leifur - Thurgadina - Bard Velious Armor (Resonant) 
# Kiladiveus - created Sub EVENT_ITEM for quest. Used Faction requirement method. 
# items: 25814, 24928, 31036, 25821, 24930, 31037, 25825, 24929, 31040, 25832, 24934, 31039, 25831, 24933, 31035, 25838, 24932, 31038, 25833, 24931, 31041

sub EVENT_SAY { 
  if ($faction <= 3) { # Require Warmly and greater faction    
    if($text=~/Hail/i){
      quest::say("The one thing this bar is sorely missin' is a good bard I tell ye. Ye know, someone to sing a catchy tune and tell us a story from time to time. Forgive me fer seemin' a bit sentimental but my family has always had close ties with bards datin' back ta even before we crossed the ocean. In fact, me great-great-grandfather used ta forge enchanted armor for the ancient bards of Faydark. Oh, the set of bard velium armor I could make if only I had the right components!");
    }
    if($text=~/what components/i){
      quest::say("With the proper components I could make a helm, a breastplate, armplates, bracers, gauntlets, greaves, and even a pair o' boots!");
    }
    if($text=~/helm/i){
      quest::say("To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.");
    }
    if($text=~/breastplate/i){
      quest::say("For the breastplate I will need a corroded breastplate and three flawless diamonds. Once I have them in my possession it will not take long to craft a sturdy breastplate.");
    }
    if($text=~/armplate/i){
      quest::say("Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.");
    }
    if($text=~/bracer/i){
      quest::say("For the bracers I will require a corroded plate bracer and a set of three crushed flame emeralds. Return to me if you happen to find these things in your travels.");
    }
    if($text=~/gauntlet/i){
      quest::say("Protecting your hands is very important. I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.");
    }
    if($text=~/greaves/i){
      quest::say("A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires. With the right techniques almost anything is possible.");
    }
    if($text=~/boots/i){
      quest::say("Boots made for battle are not always the most comfortable available. However if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble.");
    }
  }
  else { 
    quest::say("I do not know you well enough to entrust you with such a quest, yet."); 
  } 
} 

sub EVENT_ITEM { 
  if ($faction <= 3) { # Require warmly and greater faction 
    if (plugin::check_handin(\%itemcount, 25814 => 3, 24928 => 1)) { # tunic 
      quest::summonitem(31036); # Item: Resonant Breastplate
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24930 => 1)) { # sleeves 
      quest::summonitem(31037); # Item: Resonant Vambraces
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");     
    } 
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24929 => 1)) { # leggings 
      quest::summonitem(31040); # Item: Resonant Greaves
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24934 => 1)) { # gauntlets 
      quest::summonitem(31039); # Item: Resonant Gauntlets
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");  
    } 
    elsif (plugin::check_handin(\%itemcount, 25831 => 3, 24933 => 1)) { # cap 	           
      quest::summonitem(31035); # Item: Resonant Helm
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24932 => 1)) { # bracers 
      quest::summonitem(31038); # Item: Resonant Bracer
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek   
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24931 => 1)) { # boots 
      quest::summonitem(31041); # Item: Resonant Boots
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    else { 
      plugin::return_items(\%itemcount); 
    } 
  }
  else { 
    quest::say("I do not know you well enough to entrust you with such an item, yet."); 
  }    
} 


#END of FILE Zone:thurgadina  ID:115090 -- Leifur 
 
