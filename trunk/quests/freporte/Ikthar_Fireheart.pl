############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: June 23,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Ikthar_Fireheart
# ID: 10081
# TYPE: Shopkeeper
# RACE: Freeport Guards
# LEVEL: 45
#
# *** ITEMS GIVEN OR TAKEN ***
#
# itemname ID- itemid
#
# *** QUESTS INVOLVED IN ***
#
#1 - questname
#2 - questname
#3 - questname
#
# *** QUESTS AVAILABLE TO ***
#
#1 - classes_that_can_do_the_quest
#2 - classes_that_can_do_the_quest
#3 - classes_that_can_do_the_quest
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
   quest::say("You look like the type who needs a suit of sturdy plate mail! I've got plenty of steel plate in stock but if you're looking for field plate we've been out of the [necessary ores] for quite some time.");
   }

   if($text=~/necessary ores/i)
   {
   quest::say("Field plate is stronger than steel or fine steel plate and offers more protection to certain areas of the body. Unfortunately. it can only be crafted with high quality ores from those goblin infested mines. If you are planning on getting some ore I can instruct you in the [techniques of crafting field plate].");
   }

   if($text=~/techniques of crafting field plate/i)
   {
   quest::say("Field plate may only be crafted in the special Freeport forge located in West Freeport. All pieces will require the appropriate plate mold. sea temper. a smithy hammer. leather backing. and chain jointing. Different amounts of ore will be needed for the various pieces of armor and the ore must be worked into [folded sheets].");
   }

   if($text=~/folded sheets/i)
   {
   quest::say("Folded sheets of high quality ore can be crafted only in the special Freeport forge or Qeynos Royal Forge in the same fashion that regular folded sheets are fashioned in a standard forge. Field plate visors. collars. and bracers require only one folded sheet of high quality ore. Helms. pauldrons. girdles. vambraces. gauntlets. and boots require two folded sheets of high quality ore. Breastplates. greaves. and cloaks require three folded sheets of high quality ore.");
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
#END of FILE Zone:freporte  ID:10081 -- Ikthar_Fireheart



