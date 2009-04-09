############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 30,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Glyssa_Sonshaw
# ID: 9067
# TYPE: Enchanter Guild Master
# RACE: Erudite
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Note ID-18013
# Odd Cold Iron Necklace ID-14585
#
# *** QUESTS INVOLVED IN ***
#
#1 - Quellious Regent Symbol
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Cleric (That Worships Quellious)
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::say("Hail! $name, welcome to the Academy of Arcane Science.");
 }

}

sub EVENT_ITEM
{
   # sealed parchment ID-1772 - Odd Cold Iron Necklace ID-14585
   if($itemcount{1772} == 1 && $itemcount{14585} == 1)
   {
   quest::say("Ah..yes, I have seen this symbol before. There is a kobold that lives among the gnomes of Ak'anon. He may be reluctant to speak with you but you have no need to fear him. He is a follower of Brell Serilis and a valuable source of information on kobold society and culture. I will construct a message for him. Deliver the message and necklace and perhaps he can enlighten you to its meaning.");
   quest::ding();
   # Odd Cold Iron Necklace ID-14585
   quest::summonitem("14585");
   # A Note ID-18013
   quest::summonitem("1779");
   quest::faction( 11, 20);
   quest::faction( 184, 20);
   quest::faction( 235, -20);
   quest::faction( 105, -20);
   }
}

#END of FILE Zone:freportw  ID:9067 -- Glyssa_Sonshaw