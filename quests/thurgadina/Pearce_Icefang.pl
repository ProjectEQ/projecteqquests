# Quest for Pearce_Icefang in Thurgadina - Beastlord Velious Armor  
# Thanks to Kiladiveus for most of this .pl - NPC ID 115063 -- Pearce_Icefang 


sub EVENT_SAY { 
  if ($faction <= 3) { # Require Warmly and greater faction    
    if ($text=~/hail/i) { 
      quest::emote("speaks in a rumbling tone."); 
      quest::say("Greetings. I only wish to speak to a beastlord. Are you a beastlord?"); 
    } 
    if ($text=~/i am a beastlord/i) { 
      quest::say("I sense that you are in tune with yourself and with nature. You have learned much from your travels and I shall help you by providing you with protection from harm and the elements in the form of armor."); 
    } 
    if ($text=~/armor/i) { 
      quest::say("For you I shall make a cap, tunic, sleeves, bracers, gloves, leggings, and boots. Each piece is a quest unto itself.  To seek the components you must search the lands for them and test the power of the spirit within."); 
    } 
    if ($text=~/cap/i) { 
      quest::say("Those who are wise as we are know that protection of the head is most important. I may be able to sew you something most interesting if you were to bring me an eroded leather cap and three pieces of crushed coral."); 
    } 
    if ($text=~/tunic/i) { 
      quest::say("If you find an eroded leather tunic and three flawless diamonds bring them to me and I shall attempt to create an enchanted tunic that will serve you well."); 
    } 
    if ($text=~/sleeves/i) { 
      quest::say("Three flawed emeralds and a set of eroded leather sleeves might be an interesting combination. The powers of the gems may be harnessed to imbue the sleeves."); 
    } 
    if ($text=~/bracer/i) { 
      quest::say("Bracers are quite easy to imbue. Simply find three crushed flame emeralds and a eroded leather bracelet and I will complete the ritual to enchant them."); 
    } 
    if ($text=~/gloves/i) { 
      quest::say("Strong protection for one's hands is important. I may be able to craft you a set of enchanted leather gloves if you find a set of eroded leather gloves and a set of three crushed topaz."); 
    } 
    if ($text=~/leggings/i) { 
      quest::say("Leggings are a bit trickier to imbue. Three flawed sea sapphires will allow me to channel the correct energies into a pair of eroded leather leggings. However, those flawed sea sapphires are somewhat rare. Return to me if you find such things in your journeys."); 
    } 
    if ($text=~/boots/i) { 
      quest::say("Simply bring me a set of three crushed black marbles and a pair of eroded leather boots and I will imbue them. I bid you good luck in finding such things."); 
    } 
  } 
  else { 
    quest::say("I do not know you well enough to entrust you with such a quest, yet."); 
  } 
} 

sub EVENT_ITEM { 
  if ($faction <= 3) { # Require warmly and greater faction 
    if (plugin::check_handin(\%itemcount, 25814 => 3, 24942 => 1)) { # tunic 
      quest::summonitem(5454); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24944 => 1)) { # sleeves 
      quest::summonitem(5455); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well.");      
    } 
    elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24943 => 1)) { # leggings 
      quest::summonitem(5458); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek 
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24948 => 1)) { # gloves 
      quest::summonitem(5457); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well.");  
    } 
    elsif (plugin::check_handin(\%itemcount, 25831 => 3, 24947 => 1)) { # cap     
      quest::summonitem(5453); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24946 => 1)) { # bracers 
      quest::summonitem(5456); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward."); 
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24945 => 1)) { # boots 
      quest::summonitem(5459);
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

#END of FILE Zone:thurgadina  ID:115063 -- Pearce_Icefang 
  
