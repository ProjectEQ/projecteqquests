############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 24,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Quest Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Palon_Deskeb
# ID: 9072
# TYPE: Guild Master Wizard
# RACE: Erudite
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Jar Of Liquid ID- 13861
# Jar of Fish ID- 13862
#
# *** QUESTS INVOLVED IN ***
#
#1 - Marr Minnows for Palon 
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#
# *** QUEST NOTES ***
#
# Minnow Needed for this quest. You hand the
# minnow the Jar of Liquid and it has a chance
# of handing you back a Jar of Fish.
#
############################################




sub EVENT_SAY
{ 

  if($text=~/Hail/i)
  {
  quest::say("Pleased to meet you. $name. Have you seen how clear the water is underneath the Academy? All sorts of life could flourish there. What a shame there are no [Marr Minnows] there.");
  }

  if($text=~/What Marr Minnows?/i)
  {
  quest::say("The Marr Minnow swims in the pond near the Temple of Marr. I wish I had one. Not a dead one. A live one. I need someone to [get the minnow].");
  }

  if($text=~/get the minnow/i)
  {
  quest::say("'Please try. Here you are. Take this jar. Offer the jar to the minnows. Maybe they will swim into it.");
  quest::summonitem(13861);
  }

}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13862 =>1 )) {
    quest::say("Ah, a wonderful addition to our pond.");
    quest::ChooseRandom(13002,13007);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:freportw  ID:9072 -- Palon_Deskeb