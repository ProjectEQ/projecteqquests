############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: June 25,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Lenka_Stoutheart 
# ID: 10136
# TYPE: Warrior
# RACE: Barbarian
# LEVEL: 35
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Boat Beakon ID- 13818
# A'kanon's Portrait ID-12146
# L.S. Pouch ID-13814
# Snapped Pole ID-13922
# Moggok's Right Eye ID-13923
#
#*** QUESTS INVOLVED IN ***
#
#1 - Boat Beacon
#2 - LS Pouch
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#2 - All
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
   quest::say("If I catch the little thief who took my pouch, may the Wolves of the North have no mercy on em!!");
   }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Boat Beakon ID- 13818
   if($itemcount{13818} == 1)
   {
   quest::ding();
   quest::say("Oh!! You must work for that Erudite named Palatos. I guess he won't have to spend anymore money drinking in Freeport. Here. Here is the portrait I kept until he could get me a new boat beacon.");
   quest::exp("100");
   #quest::givecash("0","0","0","0");

   ### Random Item choosing if needed
   # $random=int(rand itemid+itemid+itemid);
   # quest::summonitem($randon);

   # A'kanon's Portrait ID-12146
   quest::summonitem("12146");

   # Wolves of the North Faction ID - 361
   quest::faction("361","1");
   # Shamen of Justice Faction ID - 294
   quest::faction("294","1");
   # Heretics Faction ID - 143
   quest::faction("143","1");
   #High Guard of Erudin Faction ID - 147
   quest::faction("147","1");
   }
    # L.S. Pouch ID-13814
 elsif($itemcount{13814} == 1)
 {
 quest::ding();
 quest::say("You found my pouch! Thanks kid. Let me buy you A drink and this is for the good work. Hmmmm. It looks as though they took my voucher. Darn it! Hey... It looks like they were using my bag to hold items they were stealing. Here you go. You can have it. It looks like junk. ");

 quest::exp("200");

 $random=int(rand 13922+13923);
 # Snapped Pole ID-13922 or Moggok's Right Eye ID-13923
 quest::summonitem($random);
 quest::givecash("0","2","0","0");
 # Faction Wolves of the North ID-361
 quest::faction("361","2");
 # Faction Shamen of Justice ID-294
 quest::faction("294","2");
 # Faction Merchants of Halas ID-213
 quest::faction("213","2");
 # Faction Steel Warriors ID-311
 quest::faction("311","2");
 # Faction Rogues of the White Rose ID-275
 quest::faction("275","-2");

 }
plugin::return_items(\%itemcount);
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
#END of FILE Zone:freporte  ID:10136 -- Lenka_Stoutheart 



