############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Lythe_Songbird
# ID: 9146
# TYPE: Bard
# RACE: Human
# LEVEL: 65
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Notice to Cease and Desist ID-9590
# Signed Agreement ID-10246
#
# *** QUESTS INVOLVED IN ***
#
#1 - Nightshade, Blade of Entropy
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Rogue
#
# *** NPC NOTES ***
#
# must drop Signed Agreement ID-10246 (for the Nightshade, Blade of Entropy (Rogue Epic 2.0))
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::say("Hello $name, Such a beautiful day for music and tales. Don't you think?");
 }

}

sub EVENT_ITEM
{
   # Notice to Cease and Desist ID-9590
   if($itemcount{9590} == 1)
   {
   quest::say("What's this? It says that you wish me to cease and desist spreading slander about the swashbuckler known as Stanos, or else . . .? You know, I am new in Freeport. Haven't been performing at this venue for long. I'm just a fledgling muse trying to make ends meet in this big city. My father told me that someday I'd have to put up my fists to protect my rights. I can see that day is today. What I have to say to you is . . . Guards, help!");

   # Attacks the PC who gave her the item
   quest::attack($name);

   }
}

#END of FILE Zone:freportw  ID:9146 -- Lythe_Songbird