############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: July 29,2005
# VERSION: 1.0
# BASE QUEST BY: MWMDRAGON
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Talym_Shoontar
# ID: 10182
# TYPE: Warrior
# RACE: Barbarian
# LEVEL: 15
#
# *** ITEMS GIVEN OR TAKEN ***
#
# itemname ID- itemid
#
# *** QUESTS INVOLVED IN ***
#
#1 - Talym's Head
#2 - questname
#3 - questname
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Paladin, Cleric
#2 - classes_that_can_do_the_quest
#3 - classes_that_can_do_the_quest
#
# *** NPC NOTES ***
#
# Must drop (Barbarian Head ID-13913) for a quest
#
############################################

######## EVENT_SAY AREA ####################
### Called when the NPC is spoken to by a PC

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("Hello $name, I hope your hunt is going well.");
   }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # itemname ID- itemid
   if($itemcount{0000} == 1)
   {
   quest::ding();
   quest::say("Thanks");
   quest::exp("0");
   quest::givecash("0","0","0","0");

   ### Random Item choosing if needed
   # $random=int(rand itemid+itemid+itemid);
   # quest::summonitem($randon);

   # itemname ID- itemid
   quest::summonitem("0000");

   # factionname Faction ID - factionid
   quest::faction("0","1");
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

# Sent from Tlin Bowfright ID-10186
if ($signal == 1)
   {
    quest::say("Antonius Bayle is a blithering fool.");
   
   # Tlin Bowfright ID-10186
   quest::signal(10186,1);
   } 

# Sent from Tlin Bowfright ID-10186
if ($signal == 2)
   {
    quest::say("All right, Tlin! I am going to smash your face in!");
   } 

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
#END of FILE Zone:freporte  ID:10182 -- Talym_Shoontar



