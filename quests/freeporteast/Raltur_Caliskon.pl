############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 24,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Raltur_Caliskon
# ID: 10100
# TYPE: Shadowknight Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# 
#
# *** QUESTS INVOLVED IN ***
#
#
# *** QUESTS AVAILABLE TO ***
#
#
# *** NPC NOTES ***
#
# Not Complete
#
############################################

######## EVENT_SAY AREA ####################
### Called when the NPC is spoken to by a PC

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("May the rage of Innoruuk flow through your veins. Welcome $name. Soon the Dismal Rage shall run rampant in the streets of Freeport. Our numbers grow. Like you, so many feel the rage within. It is now time to [ serve Innoruuk ].");
   }

    if($text=~/serve Innoruuk/i)
   {
   quest::say("Wise choice. We of the Dismal Rage have learned of the value of incompetence. As the Teir'Dal use the ogres and the trolls so to shall the Dismal Rage have A pawn in this game. Ours is the Freeport Militia. They trust us. How unfortunate for them. I want you to go speak with Sir Lucan D'lere, the so called ruler of this city and leader of this mob of ruffians called the Freeport Militia. Tell him you are [ from the Shrine of Innoruuk ]. Do as he asks. Little favors lead to large debts. And if you should find something of importance, bring it to me not that inept warrior.");
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18822 =>1 )) {
    quest::say("So the great Antonius Bayle wishes to ally himself with the mighty Knights of Truth. How pathetic. It would appear that the alliance has spawned infiltrators of sorts. Of course, we of the Dismal Rage are already aware of this, but I am sure Sir Lucan D'Lere knows nothing as usual. I have a [mission] for any evil shadowknight of Innoruuk.");
    quest::exp(5000);
    quest::faction( 235,1 );
    quest::faction( 86,1 );
    quest::faction( 184,-3 );
    quest::givecash(0,2,0,0);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10100 -- Raltur_Caliskon



