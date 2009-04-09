############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 25,2005
# VERSION: 1.0
# ORIGIONAL QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Toxdil
# ID: 9123
# TYPE: Shopkeeper
# RACE: Dark Elf
# LEVEL: 40
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Snake Venom Sac ID-14017
# Snake Venom ID-14016
# A Tiny Key ID-12352
# A Sparkling Sapphire ID-12349
#
# *** QUESTS INVOLVED IN ***
#
#1 - Toxdils Poison
#2 - Burning Rapier
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Rogue
#2 - Rogue
#
# *** NPC NOTES ***
#
# Merchant ID-2 (In MWMDRAGON-EQDB (Unreleased at the moment))
#
############################################


sub EVENT_SAY { 
  if($text=~/Hail/i) {
    quest::say("Correct. Toxdil is my name. No last name. I swear allegiance to no house nor guild. What brings you down here? Perhaps you seek my [deadly liquid], perhaps not. Whatever your reasons, I warn you to keep an eye out for the militia. They have begun to patrol the sewers.");
  }
  if ($text=~/deadly liquid/i && $class eq "Rogue") {
    quest::say("The deadly liquid I offer to rogues is called spider venom. I will be glad to make it for you, but first you must supply me with two snake venom sacs and my fee of 20 gold pieces. You may find the sacs upon the giant snakes of the Commonlands.");
  }
  if ($text=~/gems/i && $class eq "Rogue") {
    quest::say("I have made an acquaintance with a certain gem and a [gem case]. I belive I still have one of the keys needed to open the case.");
  }
  if ($text=~/gem case/i && $class eq "Rogue") {
    quest::say("I will give you the key on one condition. That you bring me what was once in the gem case. I belive the last I saw of it, I had sold it to a jewler... Yes, I think Noresa was her name.");
  }
}

sub EVENT_ITEM {
  if ($itemcount{14017} == 2 && $gold == 20) {
    quest::ding();
    quest::summonitem(14016); # Snake Venom
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount, 12353 => 1)) {
    quest::say("The gem!! I would notice it's sparkle anywhere!! I cannot believe you are handing it back to me!! What a fool. Here you are fool. You can have this worthless key now.");
    quest::ding();
    quest::summonitem(12351); # A Tiny Key
    quest::exp(15000);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:freportw  ID:9123 -- Toxdil

