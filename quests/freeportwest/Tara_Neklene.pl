############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Tara_Neklene
# ID: 9077
# TYPE: Guild Master Magician
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Illegible Cantrip ID-13845
#
# *** QUESTS INVOLVED IN ***
#
#1 - Orcish Cantrips (West Freeport)
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#
############################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("It is always a pleasure to meet a new face. We have many who travel far and wide to visit our great academy. Many who brave the long trip by boat. Many who dare to cross the territory of the [Deathfist orcs].");
  }
  if($text=~/deathfist orcs/i) {
    quest::say("The Deathfist are a clan of orcs. They are not very powerful, yet I hear they dabble in the circles of magic. Their skills in the ways of magic are limited. It is my duty to study them. I shall pay for your services. Will you [assist with the research]?");
  }
  if($text=~/assist with the research/i) {
    quest::say("Yes. You will do. Go into the lands which surround Freeport. There you shall encounter Deathfist apprentices. They are as young as yourself and each should carry an orc cantrip. Return one for further studies. Do so and you will earn your pay as well as our respect.");
  }
  if($text=~/test the might of the orc oracles/i) {
    quest::say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us. Perform more tasks for the great Tara Neklene.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13845 => 1)) { #Illegible Cantrip
    quest::say("Very fine work, my young apprentice. This shall be very useful in understanding their ways. I have heard rumors of a scribe who can decipher these scrolls. He is said to frequent the local taverns. Bah!! If I cannot decipher them, no one can!! Continue with your work. Soon you shall advance enough to [test the might of the orc oracles].");
    quest::ding();
    quest::exp(25);
    quest::givecash (3,12,0,0);
    quest::faction(11,1);   #Arcane Scientists
    quest::faction(184,1);  #Knights of Truth
    quest::faction(235,-1); #Opal Dark Briar
    quest::faction(105,-1); #Freeport Militia
  }
  plugin::return_items(\%itemcount);
} 
#END of FILE Zone:freportw  ID:9077 -- Tara_Neklene