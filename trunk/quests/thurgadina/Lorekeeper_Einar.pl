# Quest for Lorekeeper Einar in Thurgadin - Monk Velium Armor (Grand Master's) 
# Kiladiveus - copied text from website. created Sub EVENT_SAY and Sub EVENT_ITEM for quest. Used Faction requirement method. 
# kiladiveus - created my own ending statments. 
# Kiladiveus - NPC ID:115118 Lorekeeper_Einar, need to change his primary faction to "coldain" 
# kiladiveus - correct grammar per Sarepean's advice. 


sub EVENT_SAY { 
  if ($faction <= 3) { # Require greater and kindly faction    
    if ($text=~/hail/i) { 
      quest::say("Greetings to you. I seek one that has chosen the path of monkhood. What do you call yourself?"); 
    } 
    if ($text=~/i am a monk/i) { 
      quest::say("Good. I had hoped you were one. I have heard that as seeker of the way you are in constant training to push yourself to your physical and mental limits. It is an admirable quality and I wish to aid you. I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots."); 
    } 
    if ($text=~/cap/i) { 
      quest::say("To create a piece of armor to protect your sensitive skull I will require three pieces of crushed coral as well as a eroded leather cap.");
    } 
    if ($text=~/tunic/i) { 
      quest::say("To create a spectacular tunic fit for your kind I will require three flawless diamonds and an eroded leather tunic. With the gems and my skills I may be able to draw out some of its magical powers."); 
    }  
    if ($text=~/sleeves/i) { 
      quest::say("Protection for your arms will come at the price of three flawed emeralds and a set of eroded leather sleeves.");
    } 
    if ($text=~/leggings/i) { 
      quest::say("I may be able to craft a set of wondrous leggings from a set of old eroded leather leggings and three flawed sea sapphires. It is amazing what you can do with a bit of magic."); 
    } 
    if ($text=~/gloves/i) { 
      quest::say("Protecting your hands is very important. I can create some excellent protection for your hands if you bring me three crushed topaz and a pair of eroded leather gloves."); 
    } 
    if ($text=~/bracers/i) { 
      quest::say("For the bracers, I will require a eroded leather bracelet as well as three crushed flame emeralds. Return to me when you find such things."); 
    } 
    if ($text=~/boots/i) { 
      quest::say("We use our feet so often, should not they be protected as well as any other portion of our bodies? If you seek fine protection for your feet return to me with three pieces of crushed black marble and a pair of eroded leather boots."); 
    } 
  } 
  else { 
   quest::say("I do not know you well enough to entrust you with such a quest, yet."); 
  } 
} 

sub EVENT_ITEM { 
  if ($faction <= 3) { # Require greater and kindly faction
    if (plugin::check_handin(\%itemcount, 25814 => 3, 24942 => 1)) { # tunic
      quest::summonitem(31092);
      quest::exp(100000);
      quest::faction(49,20); # coldain
      quest::faction(67,20); # Dain Frostreaver IV
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    }
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24944 => 1)) { # sleeves 
      quest::summonitem(31093); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");    
    } 
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24943 => 1)) { # leggings 
      quest::summonitem(31096); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24948 => 1)) { # gloves 
      quest::summonitem(31095); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    } 
    elsif (plugin::check_handin(\%itemcount, 25831 => 3, 24947 => 1)) { # cap 
      quest::summonitem(31091); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    } 
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24946 => 1)) { # bracer 
      quest::summonitem(31094); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    } 
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24945 => 1)) { # boots 
      quest::summonitem(31097); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
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

#END of FILE Zone:thurgadina  ID:115118 -- Lorekeeper_Einar 

