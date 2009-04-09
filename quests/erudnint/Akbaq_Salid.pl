# Quest for Akbaq_Salid in erudnint - Titan Samples (good) 
# NPC ID 23077 -- Akbaq_Salid 


sub EVENT_SAY { 
  if ($faction <= 5) { # Require indifferent or greater faction    
if ($text=~/hail/i) { 
       quest::say("Greetings, $name. I have recently returned to Erudin since hearing word of the titan spirits that inhabit the Stonebrunt Mountains. Should you be heading in that direction there are some [samples] that I am interested in acquiring."); 
    } 
    if ($text=~/samples/i) { 
      quest::say("The titan spirits of the Stonebrunt Mountains appear in several various animal forms seemingly with different areas of influence in the spirit world. I am interested in conducting some experiments on the hides of the giant leopard titan and the giant sabretooth titan. Once I have acquired those hides I will seek to conduct experiments on the [others]."); 
    } 
    if ($text=~/others/i) { 
      quest::say("Once I have finished my studies of the feline titans pelts I am interested in experimenting with the hides of the strongest of the stonebrunt titans. the gigantic gorilla and the gargantuan panda. The [ancient snake] that inhabits those mountains is another matter that you may be interested in as well."); 
    } 
    if ($text=~/ancient snake/i) { 
      quest::say("I believe I have uncovered a process with which to harness the mystical properties of the scales of the snake titan so that they can be fashioned into a powerful robe. If you bring me the ancient snake skin and some platinum thread I am sure there will be enough material to craft multiple robes and I shall reward you with one for your assistance."); 
    } 
  } 
  else { 
    quest::say("I do not know you well enough to entrust you with such a quest, yet."); 
  } 
} 

sub EVENT_ITEM { 
  if ($faction <= 5) { # Require indifferent or greater faction 
    if (plugin::check_handin(\%itemcount, 6960 => 1, 6946 => 1)) { # astral cloak of the titans 
      quest::summonitem(2573); 
      quest::say("These are the pelts of the most powerful of the known Titan spirits. You have done well, $name, and you will be rewarded for your services."); 
    } 
    elsif (plugin::check_handin(\%itemcount, 6958 => 1, 6964 => 1)) { # astral leggings of the titans 
      quest::summonitem(2575); 
      quest::say("Excellent! These pelts are in fine condition. I was 
unsure what would happen to the physical forms of the titans when slain 
in this realm.");      
    } 
    elsif (plugin::check_handin(\%itemcount, 6947 => 1, 12097 => 1)) { # scaled robe of the elder serpent 
      quest::summonitem(2574); 
      quest::say("Ah! I have been anxiously awaiting the oppurtunity to craft some powerful robes from these mystical scales."); 
    } 
    else { 
      plugin::return_items(\%itemcount); 
      quest::say("These are not the samples I need.");
      return 1;
    } 
  } 
  else { 
    quest::say("I do not know you well enough to entrust you with such an item, yet."); # Text here is made up 
    return 1;
  }    
  quest::faction(60,10); #faction with Crimson hands increased 
  quest::faction(145,10); #faction with High Council of Erudin increased 
  quest::faction(143,-30); #faction with Heretics decreased 
  quest::faction(147,10); #faction with High Guards of Erudin increased 
  quest::exp(150); 
  } 

#END of FILE Zone:erudnint  ID:23077 -- Akbaq_Salid 
