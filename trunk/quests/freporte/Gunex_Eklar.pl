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
# NAME: Gunex_Eklar
# ID: 10099
# TYPE: Shadowknight Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Note to Quan Nektogo ID-19845
# Raenna Griff's Head ID-19934
# Dull Dismal Longsword ID-19923
#
# *** QUESTS INVOLVED IN ***
#
#1 - Note to Quan Nektogo
#2 - Shadowknight Final Task
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Shadowknight
#2 - Shadowknight
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
   quest::say("Begone lest you seek instruction. I am very busy. I teach those who [follow the path of rage] as a Shadowknight. the leaders of the Dismal Rage.");
   }

   if($text=~/follow the path of rage/i)
   {
   quest::say("As the leaders of the Dismal Rage we Shadowknights forefront of our struggles. We use the spiritual guidance of our Clerics. the Dark Arts of our Necromancers. and the tactics of our Warriors to advance the causes and secure the needs of our followers. If you aspire to be of importance to your colleagues you must first obtain a suit of armor to defend you from the aggressions of our enemies. Take this note to Quan Nektogo here in the eastern quarter of Freeport. He will aid you in the construction of your armor. When you are properly outfitted return to me and I will present you with an [important task].");
   # Note to Quan Nektogo ID-19845
   quest::summonitem("19845");
   }

   if($text=~/important task/i)
   {
   quest::say("It has come to our attention that a paladin of the Sentries of Passion. Raenna Griff. has been aiding sympathizers and wanted members of the Sentries of Passion and the Knights of Truth in the sewer tunnels beneath the western quarter of Freeport. The incompetent Freeport Militia has yet to capture these wanted followers of the Mar twins. We will wait for their capture no longer. Seek this Raenna Griff individual and slay her. I want her head presented to me this very night!");
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Raenna Griff's Head ID-19934
   if(plugin::check_handin(\%itemcount, 19934 => 1))
   {
     quest::ding();
     quest::say("It took you long enough. I wonder if the Militia will be able to identify the body minus its head. Take this Dull Dismal Long Sword and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is accomplished deliver the Sharpened Dismal Long Sword and a Giant Rattlesnake Skin to Quan Nektogo. He will make the final preparations on your weapon.");
     quest::exp("100");
     #quest::givecash("0","0","0","0");

     # Dull Dismal Longsword ID-19923
     quest::summonitem("19923");

     # Dismal Rage ID - 86
     quest::faction("86","1");
     # Opal Dark Briar ID - 235
     quest::faction("235","1");
     # Knights of Truth ID - 184
     quest::faction("184","-1");
   }

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
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
#END of FILE Zone:freporte  ID:10099 -- Gunex_Eklar



