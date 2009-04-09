############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Zhem_Xecia
# ID: 10095
# TYPE: Cleric Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Note to Jerra Renlock ID-19844
#
# *** QUESTS INVOLVED IN ***
#
#1 - Note to Jerra
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Cleric (Evil)
#
# *** NPC NOTES ***
#
#
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("What is it maggot? I have only time for new clerics who have chosen to [serve the Dismal Rage]. If you are looking for meaningless banter. than I suggest you find a bar wench.");
}

if($text=~/serve the dismal rage/i)
{
quest::say("The clerics of the Dismal Rage must be strong and familiar with battle. There are many beings across Norrath who oppose our deity and our dogma. Take this note to Jerra Renlock and she will aid you in obtaining a suit of armor to protect you from the physical threats of our enemies and the creatures of the wild.  Once you have been properly outfitted return to me and will offer you [further instruction].");
# Note to Jerra Renlock ID-19844
quest::summonitem("19844");
}

if($text=~/further instruction/i)
{
quest::say("So you think you are ready to face the enemies of the Dismal Rage? Be careful to not be blinded by your arrogance or anger. You must focus the rage in your soul and refine it into patient and insidious hatred. A cleric of the Sentries of Passion. Ulia Yovar. has been attempting to uncover our allies among the citizens of Freeport and is believed to be in hiding in the sewer tunnels under the western quarter of Freeport. Seek this enemy of the Dismal Rage and bring me her head.");
}

}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 19933 =>1 )) {
   quest::say("Thank you $name.  Your work makes the Dismal Rage even stronger.  Take this as your reward.");
   quest::summonitem(19939);
   quest::exp(100);
 } 
}
#END of FILE Zone:freporte  ID:10095 -- Zhem_Xecia

 
