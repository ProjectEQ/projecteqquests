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
# NAME: Jasmine_Yiur
# ID: 10014
# TYPE: Warrior
# RACE: Human
# LEVEL: 25
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Note to Guard Bribbely ID- 55003
# Bundle of Mail ID-55002
# Seawind Necklace ID-55027
#
# *** QUESTS INVOLVED IN ***
#
#1 - Jasmine's Big Predicament 
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
   quest::say("Oh, hello. Sorry,");
   quest::emote("lowers her head.");
   quest::say("I am not really in best form today. I am in a bit of a [big predicament].");   
   }

   if($text=~/big predicament/i)
   {
   quest::say("I work for the League of Antonican Bards. As you may or may not know, we are sometimes tasked with the delivery of mail to various cities around Norrath. A shipment of mail was to be delivered from here to Qeynos. It was supposed to arrive several days ago but I have received word that it never arrived. I have recently been informed by the guards that the ship was stolen before it could leave port. The guards reported seeing a large number of trolls board the ship and sail away with it in the dead of the night. The League and myself would be most appreciative of such a brave adventurer's [help].");   
   }

   if($text=~/help/i)
   {
   quest::emote("gives you a warm smile.");
   quest::say("'That is the first time I have smiled in days, this mess has me so worried. Not only are we missing the mail but now an entire ship. Please take this note to Guard Bribbely. He is probably still near the docks investigating this matter.");   
   # Note to Guard Bribbely ID- 55003
   quest::summonitem("55003");
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Bundle of Mail ID-55002
   if($itemcount{55002} == 1)
   {
   quest::ding();
   quest::say("I am so happy to see that you have returned, and with the mail! You are truly a hero. I will make certain that the other members of the League hear about you. You didn't find the missing ship you say? Guard Bribbely will not be pleased, but you did all that you could. Please take this for payment of your brave deeds. May we meet again.");
   quest::exp("200");

   # Seawind Necklace ID-55027
   quest::summonitem("55027");

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

######## EVENT_DEATH_COMPLETE AREA ##################
### Called when the NPC is killed

sub EVENT_DEATH_COMPLETE
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
#END of FILE Zone:freporte  ID:10014 -- Jasmine_Yiur



