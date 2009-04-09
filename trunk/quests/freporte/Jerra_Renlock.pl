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
# NAME: Jerra_Renlock
# ID: 10126
# TYPE: Rogue
# RACE: Human
# LEVEL: 30
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Note to Jerra Renlock ID-19844
# Mail Assembly Kit ID-17124
#
# *** QUESTS INVOLVED IN ***
#
#1 - Note for Jerra Renlock
#2 - Dismal Priest Boots
#3 - Dismal Priest Bracer
#4 - Dismal Priest Breastplate
#5 - Dismal Priest Gauntlets
#6 - Dismal Priest Greves
#7 - Dismal Priest Helm
#8 - Dismal Priest Vembraces
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Cleric (Evil)
#2 - Cleric (Evil)
#3 - Cleric (Evil)
#4 - Cleric (Evil)
#5 - Cleric (Evil)
#6 - Cleric (Evil)
#7 - Cleric (Evil)
#8 - Cleric (Evil)
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
   quest::say("Yes? What is it you want from me? I have nothing that you would be interested in. Not even money to pay the ridiculous taxes imposed by the Freeport Militia.");
   }

    if($text=~/dismal priest boots/i)
   {
   quest::say("'To assemble Dismal priest Mail Boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Coyote Pelts, and two Large Fire Beetle Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19634);
   } 

    if($text=~/dismal priest bracer/i)
   {
   quest::say("To assemble a Dismal priest Mail Bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Coyote Pelt and a Sand Scarab Hatchling Sternite in the Mail Assembly Kit.");
   quest::summonitem(19632);
   }  

    if($text=~/dismal priest breastplate/i)
   {
   quest::say("To assemble a Dismal priest Breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Coyote Pelt, a Giant Fire Beetle Carapace, and two Giant Fire Beetle Tergites in the Mail Assembly Kit.");
   quest::summonitem(19637);
   } 

    if($text=~/dismal priest gauntlets/i)
   {
   quest::say("To assemble Dismal priest Gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Coyote Pelt and two Sand Scarab Hatchling Tarsi in the Mail Assembly Kit.");
   quest::summonitem(19633);
   } 

    if($text=~/dismal priest greaves/i)
   {
   quest::say("To assemble Dismal priest Greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Coyote Pelts and two Large Fire Beetle Sternites in the Mail Assembly Kit.");
   quest::summonitem(19636);
   } 

    if($text=~/dismal priest helm/i)
   {
   quest::say("To assemble a Dismal priest Helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Coyote Pelt and two Sand Scarab Hatchling Eyes in the Mail Assembly Kit.");
   quest::summonitem(19631);
   } 

    if($text=~/dismal priest vambraces/i)
   {
   quest::say("To assemble Dismal priest Vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Coyote Pelt and two Large Fire Beetle Patella in the Mail Assembly Kit.");
   quest::summonitem(19635);
   } 

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Note to Jerra Renlock ID- 19844
   if($itemcount{19844} == 1)
   {
   quest::ding();
   quest::say("Ah, so Zhem wants me to assist you with some armor. You will surely need it if you are an associate of the likes of him. This Mail Assembly Kit will be needed for you to construct your armor. The materials required depend on the armor section you plan to construct. Do you plan to construct a [dismal priest helm], a [dismal priest bracer], [dismal priest gauntlets], [dismal priest boots], [dismal priest vambraces], [dismal priest greaves], or a [dismal priest breastplate].");
   ## quest::exp("0");
   #quest::givecash("0","0","0","0");

   ### Random Item choosing if needed
   # $random=int(rand itemid+itemid+itemid);
   # quest::summonitem($randon);

   # Mail Assembly Kit ID-17124
   quest::summonitem("17124");

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

######## EVENT_WAYPOINT AREA ###############
### Called when the NPC reaches a waypoint

sub EVENT_WAYPOINT
{



}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10126 -- Jerra_Renlock



