# Quest for Terman_Underbelly in Thurgadina - Shaman Velious Armor (Rune Crafter) 
# Kiladiveus - created Sub EVENT_ITEM for quest. Used Faction requirement method. 

sub EVENT_SAY { 
  if ($faction <= 3) { # Require Warmly and greater faction    
    if($text=~/hail/i){ 
      quest::emote("speaks in a rumbling tone.");
      quest::say("Greetings. I only wish to speak to a shaman. Are you a shaman?"); 
    }
    if($text=~/i am a shaman/i){
      quest::say("I sense the strength of your mystical powers within you and they vibrate with power.  You have learned much from your travels and I shall help you by providing you with protection from harm and the elements in the form of armor.");
    }
    if($text=~/armor/i){
      quest::say("For you I shall make a coif, tunic, sleeves, bracers, gauntlets, leggings, and boots. Each piece is a quest unto itself. To find the components you must search the lands for them and test the power of the spirit within.");
    }
    if($text=~/coif/i){
      quest::say("Those who are wise as we are know that protection of the head is most important. I may be able to forge you something most interesting if you were to bring me a corroded chain coif and three pieces of crushed onyx sapphire.");
    }
    if($text=~/tunic/i){
    quest::say("If you find a corroded chain tunic and three pieces of black marble bring them to me and I shall attempt to create an enchanted tunic that will serve you well.");
    }
    if($text=~/sleeves/i){
      quest::say("Three jaundice gems and a set of corroded chain sleeves might be an interesting combination. The powers of the gems may be harnessed to imbue the sleeves.");
    }
    if($text=~/bracer/i){
      quest::say("Bracers are quite easy to imbue. Simply find three crushed opals and a corroded chain bracer and I will complete the ritual to enchant them.");
    }
    if($text=~/gauntlets/i){
      quest::say("Strong protection for one's hands is important. I may be able to craft you a set of powerful chain gauntlets if you find a set of corroded chain gauntlets and three crushed lava rubies.");
    }
    if($text=~/leggings/i){
      quest::say("Leggings are a bit trickier to imbue. Three chipped onyx sapphires will allow me to channel the correct energies into a pair of corroded chain leggings. However, those chipped onyx sapphires are somewhat rare. Return to me if you find such things in your journeys.");
    }
    if($text=~/boots/i){
      quest::say("Simply bring me a set of three crushed flame emeralds and a pair of corroded chain boots and I will imbue them. I bid you good luck in finding such things."); 
    }
  } 
  else { 
    quest::say("I do not know you well enough to entrust you with such a quest, yet."); 
  } 
} 

sub EVENT_ITEM { 
  if ($faction <= 3) { # Require warmly and greater faction 
    if (plugin::check_handin(\%itemcount, 25805 => 3, 24935 => 1)) { # tunic 
      quest::summonitem(31008); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25815 => 3, 24937 => 1)) { # sleeves 
      quest::summonitem(31009); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");     
    } 
    elsif (plugin::check_handin(\%itemcount, 25827 => 3, 24936 => 1)) { # leggings 
      quest::summonitem(31012); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well.");
    } 
    elsif (plugin::check_handin(\%itemcount, 25840 => 3, 24941 => 1)) { # gauntlets 
      quest::summonitem(31011); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25841 => 3, 24940 => 1)) { # cap 	
      quest::summonitem(31007); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25836 => 3, 24939 => 1)) { # bracers 
      quest::summonitem(31010); 
      quest::exp(100000); 
      quest::faction(49,20); # coldain 
      quest::faction(67,20); # Dain Frostreaver IV 
      quest::faction(188,-60); # Kromrif 
      quest::faction(189,-60); # Kromzek
      quest::emote("smiles warmly as he hands you your reward.");
      quest::say("You have done well."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 25838 => 3, 24938 => 1)) { # boots 
      quest::summonitem(31013); 
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
      quest::say("These are not the pieces I need."); 
    } 
  }
  else { 
    quest::say("I do not know you well enough to entrust you with such an item, yet."); 
  }    
} 

#END of FILE Zone:thurgadina  ID:115147 (lvl38) 115215(lvl40) -- Terman_Underbelly
 
