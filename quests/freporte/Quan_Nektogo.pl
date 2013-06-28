############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 25,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Quan_Nektogo
# ID: 10125
# TYPE: Rogue
# RACE: Human
# LEVEL: 30
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Sealed Letter ID-26644 (Not the correct note, but usaable until it is collected)
# Sharpened Dismal Long Sword ID-19928
# Giant Rattlesnake Skin ID-19852
# Dismal Rage Long Sword ID-19940
# Mail Assembly Kit ID-17124
#
# *** QUESTS INVOLVED IN ***
#
#1 - Note from Gunex
#2 - Dismal Knight Boots
#3 - Dismal Knight Bracer
#4 - Dismal Knight Breastplate
#5 - Dismal Knight Gauntlets
#6 - Dismal Knight Greaves
#7 - Dismal Knight Helm
#8 - Dismal Knight Vambraces
#9 - Dismal Knight Important Task
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Shadowknight
#2 - Shadowknight
#3 - Shadowknight
#4 - Shadowknight
#5 - Shadowknight
#6 - Shadowknight
#7 - Shadowknight
#8 - Shadowknight
#9 - Shadowknight
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
   quest::say("Sorry friend. I have nothing to sell at the moment. These taxes imposed by the Freeport Militia and the Coalition of Tradefolk take a heavy toll on us poor folk.");
   }

   if($text=~/forge/i)
   {
   quest::say("You can find them all over freeport. Inside and out of many of the buildings where Weapons and armor are sold.");
   }

    if($text=~/dismal knight boots/i)
   {
   quest::say("To assemble Dismal Knight Boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Cat Pelts, and two Large Leaf Scarab Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19634);
   }

   if($text=~/dismal knight bracer/i)
   {
   quest::say("To assemble a Dismal Knight Bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Cat Pelt and a Leaf Scarab Sternite in the Mail Assembly Kit.");
   quest::summonitem(19632);
   }

    if($text=~/dismal knight breastplate/i)
   {
   quest::say("To assemble a Dismal Knight Breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Medium Quality Cat Pelt, a Giant Leaf Scarab Carapace, and two Giant Leaf Scarab Tergites in the Mail Assembly Kit.");
   quest::summonitem(19637);
   }

   if($text=~/dismal knight gauntlets/i)
   {
   quest::say("To assemble Dismal Knight Gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Cat Pelt and two Leaf Scarab Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19633);
   }

   if($text=~/dismal knight greaves/i)
   {
   quest::say("To assemble Dismal Knight Greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Cat Pelts and two Large Leaf Scarab Sternites in the Mail Assembly Kit.");
   quest::summonitem(19636);
   }

    if($text=~/dismal knight helm/i)
   {
   quest::say("To assemble a Dismal Knight Helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Cat Pelt and two Large Leaf Scarab Eyes in the Mail Assembly Kit.");
   quest::summonitem(19631);
   }

   if($text=~/dismal knight vambraces/i)
   {
   quest::say("To assemble Dismal Knight Vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Cat Pelt and two Large Leaf Scarab Patella in the Mail Assembly Kit.");
   quest::summonitem(19635);
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Sharpened Dismal Long Sword ID-19928 - Giant Rattlesnake Skin ID-19852
   if (plugin::check_handin(\%itemcount, 19928 =>1, 19852=>1 )) {
      quest::ding();
   quest::emote(" fashions a grip out of the giant rattlesnake skin and polishes the blade of the sword with a strange glowing substance.");
   quest::say("May your new sword see the deaths of many enemies!");
   quest::exp("100");
   # Dismal Rage Long Sword ID-19940
   quest::summonitem("19940");
   }


if (plugin::check_handin(\%itemcount, 19845 =>1 )) {

   quest::say("Sorry buddy I didn't realize you were one of us. I've got no problem helping out an associate of Gunex. You'll need this Mail Assembly Kit to construct your new armor. The materials required depend on the section of armor you're planning on crafting. Do you plan on crafting a [dismal knight helm], a [dismal knight bracer], [dismal knight gauntlets], [dismal knight boots], [dismal knight vambraces], [dismal knight greaves], or a [dismal knight breastplate].");
   # Mail Assembly Kit ID-17124
   quest::summonitem("17124");

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
#END of FILE Zone:freporte  ID:10125 -- Quan_Nektogo



