
############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Hyrill_Pon
# ID: 9060
# TYPE: Rogue
# RACE: Human
# LEVEL: 8
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Torn Parchment ID-18010
#
# *** QUESTS INVOLVED IN ***
#
#1 - Hollow Skull
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Enchanter , Magician , Necromancer
#
############################################

sub EVENT_SAY
{
 if($text=~/Hail/i)
 {
   quest::say("What do you want?  Leave me be!  Can't a man drown his sorrows in peace!?");
 }
}

sub EVENT_ITEM
{
 if($class != 'Enchanter' || $class != 'Magician' || $class != 'Necromancer' || $class != 'Wizard')
 {
 quest::say("I am sorry. But you have no business giving ne this junk.");
 quest::summonitem($item1) if($item1);
 quest::summonitem($item2) if($item2);
 quest::summonitem($item3) if($item3);
 quest::summonitem($item4) if($item4);
 return;
 }
 else
     {
 # Torn Parchment ID-18010
 if($itemcount{18010} == 1)
 {
   quest::say("Peh! He thinks this old skull he found is a legendary skull of Wun Toque. It is said, a wizard who possesses one is granted power and intelligence far beyond those of his peers. Yiz was searching for the skulls missing ruby eyes. It seems he found the location of the first eye. Hmm.. Lynuga.. Lynuga.. I think I have heard that name before.. Yeah! Now I remember. I met her in the Foreign Quarter of Neria.. um.. Highpass Hold. She was trying to hawk some stolen gems! I think she mumbled something about going home to Grobb. I sure don't have time to track her down.");
   quest::ding();
   quest::exp(1000);
    # Commons Residents Faction
    quest::faction("51","3");
    # Freeport Militia Faction
    quest::faction("105","3");
    # Knights of Truth Faction
    quest::faction("184","3");
    # Priests of Marr Faction
    quest::faction("258","3");
 }
     }

}

#END of FILE Zone:freportw  ID:9060 -- Hyrill_Pon.pl
