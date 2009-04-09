############################################
# ZONE: East Freeport (freeporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 26,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Olunea_Miltin
# ID: 10016
# TYPE: Warrior
# RACE: Human
# LEVEL: 8
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Snapped Pole ID- 13922
#
# *** QUESTS INVOLVED IN ***
#
#1 - Repaired Pole
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
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
   quest::say("Hello. It is good to meet you. Try not to scare the fish away. This is A good spot I supply fish to the Grub N' Grog. The patrons there love me!");
   }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Snapped Pole ID- 13922
   if($itemcount{13922} == 1)
   {
   quest::ding();
   quest::say("Great! Thank you stranger. The rogues must have broken it. At least I could repair it. It would be seasons before I could afford another pole.");
   quest::exp("50");
   quest::givecash("8","0","0","0");
  
   # Freeport Militia Faction ID - 105
   quest::faction("105","1");
   # Coalition of Tradefolk Underground Faction ID - 48
   quest::faction("48","1");
   # Knights of Truth Faction ID - 184
   quest::faction("184","-1");
   # Priests of Marr Faction ID - 258
   quest::faction("258","-1");
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

######## EVENT_WAYPOINT AREA ###############
### Called when the NPC reaches a waypoint

sub EVENT_WAYPOINT
{



}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10016 -- Olunea_Miltin



