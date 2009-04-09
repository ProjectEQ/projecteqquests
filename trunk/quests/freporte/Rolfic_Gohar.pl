############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: yourname
#
# *** NPC INFORMATION ***
#
# NAME: Rolfic_Gohar
# ID: 10184
# TYPE: Shopkeeper
# RACE: Human
# LEVEL: 30
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Sealed Letter ID-26644 (Not the correct note, but usaable until it is collected)
# Mail Assembly Kit ID-17124
#
# *** QUESTS INVOLVED IN ***
#
#1 - Note from Brutol
#2 - Dismal Warrior Helm
#3 - Dismal Warrior Bracer
#4 - Dismal Warrior Gauntlets
#5 - Dismal Warrior Boots
#6 - Dismal Warrior Vambraces
#8 - Dismal Warrior Greaves
#9 - Dismal Warrior Breastplate
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior (Evil)
#2 - Warrior (Evil)
#3 - Warrior (Evil)
#4 - Warrior (Evil)
#5 - Warrior (Evil)
#6 - Warrior (Evil)
#7 - Warrior (Evil)
#8 - Warrior (Evil)
#9 - Warrior (Evil)
#
# *** NPC NOTES ***
#
# Should be  Weapons merchant
#
############################################

######## EVENT_SAY AREA ####################
### Called when the NPC is spoken to by a PC

sub EVENT_SAY
{
   if($text=~/hail/i)
   {
   quest::say("I am but a poor peddler of trinkets living amongst the rats and beggars of these slums. Perhaps you will purchase some of my wares and help a struggling merchant?");
   }

   if($text=~/forge/i)
   {
   quest::say("You can find forges all over freeport.");
   }

   if($text=~/dismal warrior breastplate/i)
   {
   quest::say("'To assemble a Dismal Warrior Breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Coyote Pelt, a Dune Tarantula Thorax, and a Dune Tarantula Abdomen in the Mail Assembly Kit.");
   quest::summonitem(19637);
   }

    if($text=~/dismal warrior helm/i)
   {
   quest::say("To assemble a Dismal Warrior Helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Coyote Pelt and two Desert Tarantula Eyes in the Mail Assembly Kit.");
   quest::summonitem(19631);
   }

    if($text=~/dismal warrior bracer/i)
   {
   quest::say("To assemble a Dismal Warrior Mail Bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Coyote Pelt and a Dune Spiderling Tibia in the Mail Assembly Kit.");
   quest::summonitem(19632);
   }

   if($text=~/dismal warrior gauntlets/i)
   {
   quest::say("To assemble Dismal Warrior Gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Coyote Pelt and two Dune Spiderling Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19633);
   }

    if($text=~/dismal warrior boots/i)
   {
   quest::say("To assemble Dismal Warrior Mail Boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Coyote Pelts, and two Dune Spiderling Hairs in the Mail Assembly Kit.");
   quest::summonitem(19632);
   }

    if($text=~/dismal warrior vambraces/i)
   {
   quest::say("To assemble Dismal Warrior Vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Coyote Pelt and two Desert Tarantula Patella in the Mail Assembly Kit.");
   quest::summonitem(19635);
   }

    if($text=~/dismal warrior greaves/i)
   {
   quest::say("To assemble Dismal Warrior Greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Coyote Pelts and two Desert Tarantula Femurs in the Mail Assembly Kit.");
   quest::summonitem(19636);
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # A Sealed Letter ID-26644 (Not the correct note, but usaable until it is collected)
   if($itemcount{26644} == 1)
   {
   quest::ding();
   quest::say("I see now we have similar interests. I will help you get outfitted in an affordable suit of armor to help you in your endeavors. You will need this Mail Assembly Kit to aid you in the construction of the armor. The materials required depend on the armor section you desire to craft. Do you plan to construct a [dismal warrior helm], a [dismal warrior bracer], [dismal warrior gauntlets], [dismal warrior boots], [dismal warrior vambraces], [dismal warrior greaves], or a [dismal warrior breastplate].");
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
#END of FILE Zone:freporte  ID:10184 -- Rolfic_Gohar



