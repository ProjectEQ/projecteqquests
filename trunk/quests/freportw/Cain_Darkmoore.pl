############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Cain_Darkmoore
# ID: 9092
# TYPE: Guild Master Warrior
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Tattered Note ID-18742
# Dirty Training Tunic ID-13572
# Deathfist Slashed Belts ID-13916
#
# *** QUESTS INVOLVED IN ***
#
#1 - Warrior Newbie Note
#2 - Deathfist Slashed Belts (Good)
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#2 - All
#
############################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, $name! We are the Steel Warriors of Freeport. Our training disciplines have created some of the finest warriors ever to walk upon Norrath. Perhaps the bards shall sing songs of you one day. Let your first mission be the extermination of [Clan Deathfist].");
  }
  if($text=~/clan deathfist/i) {
    quest::say("The orcs of the Commonlands call themselves Clan Deathfist. They have committed many vile acts upon the residents of the Commonlands as well as persons traveling to and from Freeport. They must be destroyed. Go forth to slay them. I shall pay a bounty for every two Deathfist belts. If you are a true warrior of the bunker. perhaps you can begin with [the green and blue].");
  }
  if($text=~/the green and blue/i && $class eq "Warrior") {
    quest::say("The green and blue was a test for all skilled warriors. All one needed do was return to me four orc legionnaire shoulderpads. Two from the loathsome green skinned Deathfist Clan and two from the vile blue skinned Crushbone Clan. But we have no more bunker battle blades to spare. We must prepare for war!!");
  }
  if($text=~/bigger problem/i) {
    quest::say("The bigger problem is the Freeport Militia. Go to the Hall of Truth and speak with the Knights of Truth about that. They have already started their campaign to rid the city of the militia. The so-called Freeport Militia is not to be trusted.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13916 => 2)) { #Deathfist Slashed Belt x 2
    quest::say("Very fine work $name. With your help, we shall soon rid the commonlands of the orcs. Then we can move on to a [bigger problem].");
    quest::ding();
    quest::givecash(0,0,8,0);
    quest::exp(50);
    quest::faction(105,-1); #Freeport Militia
    quest::faction(311,4);  #Steel Warriors
    quest::faction(184,4);  #Knights of Truth
  }
  elsif(plugin::check_handin(\%itemcount, 18742 => 1)) { #A Tattered Note
    quest::say("Welcome to the Steel Warriors, young warrior. It is time to prove your mettle. Look to the outskirts of Freeport and join the fray. Show Clan Deathfist what a warrior of the bunker can do.");
    quest::ding();
    quest::summonitem(13572); #Dirty Training Tunic
    quest::exp(100);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9092 -- Cain_Darkmoore