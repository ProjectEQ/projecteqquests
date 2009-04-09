############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 26,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
# *** NPC INFORMATION ***
#
# NAME: Palatos_Kynarn
# ID: 10112
# TYPE: Enchanter
# RACE: Erudite
# LEVEL: 22
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Capt. Orlin's Spiced Ale ID- 13817
# Beacon Mount ID-12145
# Boat Beacon ID-13818
#
# *** QUESTS INVOLVED IN ***
#
#1 - Ale for Palatos
#2 - The Painting
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
   quest::say("What do you want?  Can't you see that I wish to be alone?!  I have no need nor desire to speak with anyone.  I have a minor dilemma to ponder and the only person I wish to speak with is the [captain].");
   }

    if($text=~/captain/i)
   {
   quest::say("If you have to ask that. you should not be in this fine establishment.");
   }

   if($text=~/Danaria sent me/i)
   {
   quest::say("If you are working for Danaria, you have been misguided. You will go back to her empty handed. Now leave. The [captain] and I have some business to discuss.");
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Capt. Orlin's Spiced Ale ID- 13817
   if($itemcount{13817} == 4)
   {
   quest::ding();
   quest::say("Ahh.. I.. Need help.. You.. take this.. Go build.. boat beacon. Ask gnomes about.. boat beacon. They know how.. Then bring back.. Unnnhh!! Prexus help me!! I will never drink again.");
   quest::me("In his drunkedness, Palatos advises you to seek out Svinal Wyspin, a Gnome merchant in North Freeport.");
   quest::exp("100");

   # Beacon Mount ID-12145
   quest::summonitem("12145");

   # Craftkeepers Faction ID - 56
   quest::faction("56","1");
   # High Council of Erudin Faction ID - 145
   quest::faction("145","1");
   # High Guard of Erudin Faction ID - 147
   quest::faction("147","1");
   # Heretics Faction ID - 143
   quest::faction("143","-1");
   }

   # Boat Beacon ID-13818
   elsif ($itemcount{13818} == 1)
   {
   quest::ding();
   quest::say("Thanks.. That saved me a lot of money. Now I can spend more time with the captain before I give this back to Lenka Stoutheart. Here is a little so...mething.");
   quest::exp("200");
   quest::givecash("0","0","0","1");

   # Craftkeepers Faction ID - 56
   quest::faction("56","1");
   # High Council of Erudin Faction ID - 145
   quest::faction("145","1");
   # High Guard of Erudin Faction ID - 147
   quest::faction("147","1");
   # Heretics Faction ID - 143
   quest::faction("143","-1");
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

######## EVENT_WAYPOINT AREA ###############
### Called when the NPC reaches a waypoint

sub EVENT_WAYPOINT
{



}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10112 -- Palatos_Kynarn



