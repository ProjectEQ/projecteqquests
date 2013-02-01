############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 30,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Driana_Poxsbourne
# ID: 9013
# TYPE: Necromancer
# RACE: Human
# LEVEL: 25
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Reagent pouch ID-1797
# Putrid substance ID- MISSING
#
# *** QUESTS INVOLVED IN ***
#
#1 - Putrid Ingrediants
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::say("Hail! $name, You best not be associating yourself with the likes of Najena.");
 }

 if($text=~/reagent/i)
 {
 quest::say("The infamous Mage, Najena employs several apprentices. These apprentices are most likely well equiped with just the reagents I need. Perhaps you can relieve them of their burden for me? Bring me 3 pouches of reagents from the Mages and you'll have the substance.");
 }

}

sub EVENT_ITEM
{
   # Reagent pouch ID-1797
   if($itemcount{1797} == 3)
   {
   quest::say("Ahh wonderful work $name Here is the substance....don't spill it HAHAHAaahhahehehe...yes......you don't want to spill that heheh.");

   quest::ding();
   quest::exp(200);

   ## # Putrid substance ID- MISSING
   ## quest::summonitem("MISSING");

   # Bloodsabers Faction
   quest::faction("21","1");
   # Opal Dark Briar Faction
   quest::faction("235","1");
   # Corrupt Qeynos Guards Faction
   quest::faction("53","1");
   # Guards of Qeynos Faction
   quest::faction("135","-1");
   #  Priests of Life Faction
   quest::faction("257","-1");
   }
}

#END of FILE Zone:freportw  ID:9013 -- Driana_Poxsbourne