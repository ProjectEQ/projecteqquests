############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: June 24,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Konious_Eranon
# ID: 10120
# TYPE: Enchanter Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered Note ID-18856
# Old Stained Robe ID-13565 
#
# *** QUESTS INVOLVED IN ***
#
#1 - Enchanter Newbie Note
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Enchanters
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
   quest::say("Greetings!  I am the mighty Konious Eranon, Master Enchanter, devoted follower of Innoruuk, and loyal assistant to the all-powerful Nexvok.");
   }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # A tattered Note ID-18856
   if($itemcount{18856} == 1)
   {
   quest::ding();
   quest::say("Take this $name, to help you in your journeys.");
   quest::exp("100");
   #quest::givecash("0","0","0","0");

   ### Random Item choosing if needed
   # $random=int(rand itemid+itemid+itemid);
   # quest::summonitem($randon);

   # Old Stained Robe ID-13565
   quest::summonitem("13565");

   # factionname Faction ID - factionid
   #quest::faction("0","1");
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
#END of FILE Zone:freporte  ID:10120 -- Konious_Eranon



