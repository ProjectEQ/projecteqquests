############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Beur_Tenlah
# ID: 10106
# TYPE: Rogue Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Dwarven Ale ID-13036
#
# *** QUESTS INVOLVED IN ***
#
#1 - Ale for Beur
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


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("Heya. $name!  I've been on watch duty all night.  Kinda makes a man thirsty. ya know?  Why don't you be a good little scamp and run up to the bar and get me a [dwarven ale]?  That sure would hit the spot right about now.");
}

if($text=~/dwarven ale/i)
{
quest::say("Ahhh..  Dwarven ale is the best.  You gotta hand it to those stinky little dirt diggers. they know how to make a good brew.  Now if they could just learn to shower. huh. Harkin? Ha ha ha!");
}

}

sub EVENT_SIGNAL
{
# Signal from Harkin Duskfoot NPCID-10107
quest::say("Heh, I got something that reminds you of home.. My armpit! Bwa haha!!!");

}

sub EVENT_ITEM
{
 #do all other handins first, then let it do disciplines
 # Dwarven Ale ID-13036
 if(plugin::check_handin(\%itemcount, 13036 => 1))
 {
 quest::ding();
 quest::say("Well, well, well.. It's about time. Whatta ya got, boots fulla stones? Or maybe yer just part turtle? Bah, anyways, thanks for the ale. Maybe I'll buy you one sometime, eh? Bwahaha!");
 quest::exp(25);
 # Signal to Harkin Duskfoot NPCID-382194
 quest::signal(382194,1);
 }
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freporte  ID:10106 -- Beur_Tenlah


