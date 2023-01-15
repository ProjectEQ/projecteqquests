# Quest for Glatigi in Thurgadina - Berserker Velious Armor (Icefury) 
# items: 25814, 24935, 55318, 25821, 24937, 55319, 25825, 24936, 55322, 25832, 24941, 55321, 25831, 24940, 55317, 25838, 24939, 55320, 25833, 24938, 55323

sub EVENT_SAY { 
  if ($faction <= 3) { # Require Warmly and greater faction    
    if($text=~/Hail/i){
      quest::say("Well met, $race! I am Glatigi. If ye seek ta join our ranks, I welcome ye with open arms and have an offer to make if you are interested. If ye seek to be our enemy, I hope ye can run swifter than my archers arrows.");
    }
    if($text=~/i am interested/i){
      quest::say("Aye, I thought ye might be. My elite Berserkers are in sore need of some enchanted armor. Unfortunately, I can’t spare the men to go out and fetch me the components. If you can do this for me, I’ll gladly reward you with a piece of it. I need materials for a coif, a tunic, sleeves, bracers, gauntlets, leggings, and boots.");
    }
    if($text=~/coif/i){
      quest::say("To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded chain coif."); 
    }
    if($text=~/tunic/i){ 
      quest::say("For the breastplate, I will need a corroded chain tunic and three flawless diamonds. Once I have them in my possession it will not take long to craft a sturdy tunic."); 
    }
    if($text=~/sleeves/i){
      quest::say("Protection for your arms will come at the price of a set of corroded chain sleeves and three flawed emeralds."); 
    }
    if($text=~/bracers/i){
      quest::say("For the bracers, I will require a corroded chain bracer and a set of three crushed flame emeralds. Return to me if you happen to find these things in your travels."); 
    }
    if($text=~/gauntlets/i){
      quest::say("Protecting your hands is very important. I can forge protection for your hands if you bring me a pair of corroded chain gauntlets and three crushed topaz."); 
    }
    if($text=~/leggings/i){
      quest::say("A set of corroded leggings might be salvageable if you were to find three flawed sea sapphires. With the right techniques almost anything is possible."); 
    }
    if($text=~/boots/i){
      quest::say("Boots made for battle are not always the most comfortable available. However if you seek a fine set for battle bring me a set of corroded chain boots and three pieces of crushed black marble.");
    }
  }
  else { 
    quest::say("I do not know you well enough to entrust you with such a quest, yet."); 
  } 
} 

sub EVENT_ITEM { 
  if ($faction <= 3) { # Require warmly and greater faction 
    if (plugin::check_handin(\%itemcount, 25814 => 3, 24935 => 1)) { # tunic 
      quest::summonitem(55318); # Item: Icefury Tunic
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24937 => 1)) { # sleeves 
      quest::summonitem(55319); # Item: Icefury Sleeves
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif 
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24936 => 1)) { # leggings 
      quest::summonitem(55322); # Item: Icefury Greaves
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif 
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24941 => 1)) { # gauntlets 
      quest::summonitem(55321); # Item: Icefury Gauntlets
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif 
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");  
    } 
    elsif (plugin::check_handin(\%itemcount, 25831 => 3, 24940 => 1)) { # coif 	
      quest::summonitem(55317); # Item: Icefury Coif 
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif 
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    } 
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24939 => 1)) { # bracers 
      quest::summonitem(55320); # Item: Icefury Bracer
      quest::exp(100000); 
      quest::faction(406,20); # coldain 
      quest::faction(405,20); # Dain Frostreaver IV 
      quest::faction(419,-60); # Kromrif 
      quest::faction(448,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    } 
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24938 => 1)) { # boots 
      quest::summonitem(55323); # Item: Icefury Boots
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


#END of FILE Zone:thurgadina  ID:115114 -- Glatigi 
 
