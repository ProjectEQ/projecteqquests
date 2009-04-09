############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 29,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Shintl_Lowbrew
# ID: 9056
# TYPE: Wizard
# RACE: Halfling
# LEVEL: 7
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Hogcallers Inn
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#
# *** NPC NOTES ***
#
# Must Drop Halfling Head ID-12148 (For the Hogcallers Inn Quest)
#
############################################


sub EVENT_SAY
{ 
if($text=~/Hail/i)
{
quest::say("Hail. mighty one! What are you doing in the city?  You should be out slaying beasts. There is nothing to find here in the city.");
}

if($text=~/Who is Hollish/i)
{
quest::say("I have never heard of this Hollish character you speak of. You must be mistaking me for someone else.");
}

if($text=~/Who is Opal/i)
{
quest::say("Opal is just a friend I have here in Freeport. She works at the Academy of Arcane Science.");
}

}

sub EVENT_ATTACK
{
quest::say("I have friends in very high places!!");
}

sub EVENT_DEATH
{ 
quest::say("You have no idea what a big mistake you made. Either my fellow rogues shall find you or the Freeport Mi.. Unnnghh");
}

#END of FILE Zone:freportw  ID:9056 -- Shintl_Lowbrew