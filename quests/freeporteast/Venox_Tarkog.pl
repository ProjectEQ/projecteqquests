############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 16,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Venox_Tarkog 
# ID: 10098
# TYPE: Cleric Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered note ID- 18744
# Faded Crimson Tunic ID-13561
#
# *** QUESTS INVOLVED IN ***
#
#1 - Newbie Note Cleric (Evil)
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

######## EVENT_SAY AREA ####################
### Called when the NPC is spoken to by a PC

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("Welcome to the shrine of the Dismal Rage.  May [Innoruuk] guide your every move in life.  Here. we will teach you to release your rage unto the world.  My priests are at your disposal.");
   }

   if($text=~/Innoruuk/i)
   {
   quest::say("You do not even know the name of the Prince of Hate!  That is a crime in here.  Our god Innoruuk speaks with Pietro Zarn himself.  It was Innoruuk who told him to create the Dismal Rage.  You should speak with our family.  Perhaps someone will help you better understand our beliefs.");
   }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # A tattered note ID- 18744
   if($itemcount{18744} == 1)
   {
   quest::ding();
   quest::say("Take this to help you on your journeys #name.");
   quest::exp("50");
   # Faded Crimson Tunic ID-13561
   quest::summonitem("13561");
   }
}

######## EVENT_AGGRO AREA ##################
### Called when the NPC is aggroed

sub EVENT_AGGRO
{



}

######## EVENT_ATTACK AREA #################
### Called when the NPC is Attacked

sub EVENT_ATTACK
{



}

######## EVENT_DEATH AREA ##################
### Called when the NPC is killed

sub EVENT_DEATH
{



}

######## EVENT_ENTER AREA ##################
### Called when a PC enters the NPCs Proximity

sub EVENT_ENTER
{



}

######## EVENT_EXIT AREA ###################
### Called when a PC exits the NPCs Proximity

sub EVENT_EXIT
{



}

######## EVENT_HP AREA #####################
### Called when the HP of the NPC drop below a set level

sub EVENT_HP
{



}

######## EVENT_SIGNAL AREA #################
### Called when a signal is sent to the NPC

sub EVENT_SIGNAL
{



}

######## EVENT_SLAY AREA ###################
### Called when the NPC kills someone

sub EVENT_SLAY
{



}

######## EVENT_SPAWN AREA ##################
### Called when the NPC spawns

sub EVENT_SPAWN
{



}

######## EVENT_TIMER AREA ##################
### Called when a timer has completed its cycle

sub EVENT_TIMER
{



}

######## EVENT_WAYPOINT_DEPART AREA ###############
### Called when the NPC reaches a waypoint

sub EVENT_WAYPOINT_DEPART
{



}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10098 -- Venox_Tarkog 



