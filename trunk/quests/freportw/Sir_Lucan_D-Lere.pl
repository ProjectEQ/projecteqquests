############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 29,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Sir_Lucan_D`Lere
# ID: 9018
# TYPE: Warrior Quild Master
# RACE: Freeport Guards
# LEVEL: 48
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Testimony of Truth
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Paladin
#
# *** NPC NOTES ***
#
# This NPC when killed is supposed to spawn an Undead version of itself to attack the aggressor.
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("Hail. citizen!  I am very busy. I do not have time to speak with you.  If you have any complaints. please direct them to City Hall.  Unless. of course. you have some personal business in which I might be interested.");
}

sub EVENT_ATTACK
{
quest::say("Let your death be a warning to all who dare oppose the Freeport Militia!");
quest::say("Die. dog!!"); }
}

sub EVENT_DEATH
{
	quest::say("You shall never get my testimony. I shall fight you from the grave!! Ha Ha Ha!! You cannot stop the undead!! Foolish mortal!! Your foul deeds have earned my contempt. ");
	quest::spawn(9147, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ());
}

sub EVENT_ITEM
{
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9018 -- Sir_Lucan_D`Lere