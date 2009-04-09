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
# NAME: Brutol_Rhaksen
# ID: 10118
# TYPE: Warrior Guild Master
# RACE: Barbarian
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered note ID-18857
# Faded Crimson Tunic ID-13561
# A Sealed Letter ID-26644 (Not the correct note, but usaable until it is collected)
# Note to Rolfic ID- MISSING
# Dismal Rage Battle Axe ID- MISSING
# Dull Axe ID-55623
# Sharpened Axe ID-59953
# Giant Rattlesnake Skin ID-19852
# Tarsa Yovar's Head ID-19932
#
# *** QUESTS INVOLVED IN ***
#
#1 - Newbie Note
#2 - Note for Rolfic
#3 - Dismal Rage Battle Axe
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#2 - Warrior
#3 - Warrior (Who believes in Innoruuk)
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
quest::say("Oh. hello down there. puny one. I'm Brutol Rhaksen. Commmander of warriors who [serve] the Dismal Rage. and that's really all you need to know..for now.");
}

if($text=~/serve/i)
{
quest::say("You must become strong to survive amongst the ranks of the Dismal Rage. Take this note to Rolfic Gohar and he will help you get a suit of armor to protect your scrawny hide from the weapons of our enemies. Once you have been properly outfitted return to me and will give you your [next orders].");
# A Sealed Letter ID-26644 (Not the correct note, but usaable until it is collected)
quest::summonitem(26644);
}

if($text=~/next orders/i)
{quest::say("Ready to make yourself useful $name ? Beneath West Freeport are sewer tunnels leading to North Freeport being used by the Knights of Truth and the Sentries and Passion that have gained too much notoriety with the Freeport Militia and the Dismal Rage to pass safely through the eastern and western quarters of Freeport. We believe a sympathizer of the Sentries of Passion. Tarsa Yovar. is hiding somewhere in the western tunnel system. The sympathizer is a Steel Warrior faithful to Erollisi and although she is only a minor nuisance must be dealt with. Find her and bring me her head.");
}

}

sub EVENT_ITEM
{ 
 # A tattered note ID-18857
 if (plugin::check_handin(\%itemcount, 18857 => 1))
 {
	quest::ding();
	quest::say("Welcome to warriors guild of East Freeport. Take this to help you on your journeys.");
	# Faded Crimson Tunic ID-13561
	quest::summonitem("13561");
	quest::exp("100");
 }
 # Tarsa Yovar's Head ID-19932
 elsif (plugin::check_handin(\%itemcount, 19932 => 1))
 {
 quest::say("Take this and get it sharpened. Bring it back to me with a Giant Rattlesnake Skin and you will have proven yourself able to wield a Dismal Rage Battle Axe, to help teach the way of Innoruuk!");
 quest::ding();
 # Dull Axe ID-55623
 quest::summonitem("55623");
 quest::exp("100");
}
 # Sharpened Axe ID-59953 - Giant Rattlesnake Skin ID-19852
 elsif (plugin::check_handin(\%itemcount, 59953 => 1, 19852 => 1))
 {

 quest::say("You have proven your faith $name. Take this to vanquish any and all whom question the absolute power of Innoruuk!");
 quest::ding();
# Dismal Rage Battle Axe ID- 19938
 quest::summonitem(19938);
 quest::exp("100");
 }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freporte  ID:10118 -- Brutol_Rhaksen


