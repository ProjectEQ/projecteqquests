#Zone: Kael Drakkal 
#Short Name: kael 
#Zone ID: 113 
# 
#NPC Name: Regbor_Vallgerthon 
#NPC ID: 113156 
# 
#Berserker Kael armor quests (Firebrand line of armor) 
#Quest texts made up from other chain users or invented completely 

sub EVENT_SAY { 
  if ($faction == 1) { #requires ally Kromzek faction 
    if ($text=~/hail/i) { 
      quest::say("Do I see an inner rage there in your eyes? Are you a berserker then?"); 
    } 
    if ($text=~/i am a berserker/i) { 
      quest::say("I will be able to craft armor for you."); 
    } 
    if ($text=~/armor/i) { 
      quest::say("What I have for you is as such, a coif, a breastplate, armplates, bracers, gauntlets, greaves and boots."); 
    } 
    if ($text=~/coif/i) { 
      quest::say("I am need of an ancient tarnished chain coif and three crushed pieces of coral. For your services I shall give you a coif suitable for one such as you."); 
    } 
    if ($text=~/breastplate/i) { 
      quest::say("For the breastplate you must seek out an ancient tarnished chain tunic and three flawless diamonds. Only then will you receive a breastplate of my crafting."); 
    } 
    if ($text=~/armplate/i) { 
      quest::say("For the armplates I shall give you, I require this; an ancient tarnished chain sleeves and three flawed emeralds."); 
    } 
    if ($text=~/bracer/i) { 
      quest::say("An ancient tarnished bracer and three crushed flame emeralds is what I require of you. A bracer of my making is your reward."); 
    } 
    if ($text=~/gauntlets/i) { 
      quest::say("I need an ancient tarnished chain gauntlets as well as three crushed topaz. Once I have these you shall have your reward."); 
    } 
    if ($text=~/greaves/i) { 
      quest::say("Bring unto me a pair of ancient tarnished chain leggings and a trilogy of flawed sea sapphires."); 
    } 
    if ($text=~/boots/i) { 
      quest::say("A fine pair of boots shall you have, once I have a pair of an ancient tarnished chain boots and three pieces of crushed black marble."); 
    } 
  } 
  else { 
    quest::say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you."); 
  } 
} 

sub EVENT_ITEM { 
  if ($faction == 1) { #requires ally Kromzek faction 
    if (plugin::check_handin(\%itemcount, 25831 => 3, 24912 => 1)) { # cap 
      quest::summonitem(55310); 
      quest::exp(150000); 
      quest::faction(179,20); # King Tormax 
      quest::faction(189,20); # Kromzek 
      quest::faction(42,-20); # Claws of Veeshan 
      quest::faction(49,-60); # Coldain 
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24907 => 1)) { # bp 
      quest::summonitem(55311); 
      quest::exp(150000); 
      quest::faction(179,20); # King Tormax 
      quest::faction(189,20); # Kromzek 
      quest::faction(42,-20); # Claws of Veeshan 
      quest::faction(49,-60); # Coldain 
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24909 => 1)) { # sleeves 
      quest::summonitem(55312); 
      quest::exp(150000); 
      quest::faction(179,20); # King Tormax 
      quest::faction(189,20); # Kromzek 
      quest::faction(42,-20); # Claws of Veeshan 
      quest::faction(49,-60); # Coldain 
      quest::emote("smiles warmly as she hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24911 => 1)) { # wrist 
      quest::summonitem(55313); 
      quest::exp(150000); 
      quest::faction(179,20); # King Tormax 
      quest::faction(189,20); # Kromzek 
      quest::faction(42,-20); # Claws of Veeshan 
      quest::faction(49,-60); # Coldain 
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24913 => 1)) { # gloves 
      quest::summonitem(55314); 
      quest::exp(150000); 
      quest::faction(179,20); # King Tormax 
      quest::faction(189,20); # Kromzek 
      quest::faction(42,-20); # Claws of Veeshan 
      quest::faction(49,-60); # Coldain 
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24908 => 1)) { # legs 
      quest::summonitem(55315); 
      quest::exp(150000); 
      quest::faction(179,20); # King Tormax 
      quest::faction(189,20); # Kromzek 
      quest::faction(42,-20); # Claws of Veeshan 
      quest::faction(49,-60); # Coldain 
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24910 => 1)) { # boots 
      quest::summonitem(55316); 
      quest::exp(150000); 
      quest::faction(179,20); # King Tormax 
      quest::faction(189,20); # Kromzek 
      quest::faction(42,-20); # Claws of Veeshan 
      quest::faction(49,-60); # Coldain 
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

#END of FILE Zone: kael ID:113156 -- Regbor_Vallgerthon