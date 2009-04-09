############################################
# ZONE: East Karana (eastkarana)
# DATABASE: Cavedude + PEQ (from server release 3.52)
# LAST EDIT: 5/1/06
# VERSION: 1.0
# DEVELOPER: ATTEMPT37
#
# *** NPC INFORMATION ***
#
# NAME: Tenal_Redblade
# ID: 15077
# TYPE: Warrior
# RACE: Human
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Redblade's Legacy ID-18083
# Totem of the Freezing War ID-20680
# Heart of Frost ID-10549
# Totem of Fiery War ID-20681
# Green Dragon Scales ID-11582
# Red Dragon Scales ID-11622
# Mark of the Sword ID-20683
# Hand of the Maestro ID-20676
# Tenal's Note to Kargek ID-20684
#
# *** QUESTS INVOLVED IN ***
#
#1 - Warrior Epic Quest
############################################

sub EVENT_SAY{
  if ($text=~/hail/i) {
    quest::say("What brings you to my home, $name? Do you seek knowledge of Rallos Zek and the great wars to come?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18083 => 1)) { #Redblade's Legacy
    quest::say("So, Kargek sent you.  How is my dear brother?  If you come to me with this book then you must be interested in the scabbard. Take this totem and return to me with it and the heart of frost from the goblins of permafrost. Do not return until this task is accomplished."); 
    quest::ding();
    quest::exp(100000);
    quest::summonitem(20680); # Totem of the Freezing War
  }
  if (plugin::check_handin(\%itemcount, 20680 => 1, 10549 => 1)) { #Totem of the Freezing War & Heart of Frost
    quest::say("Very good, you have wreaked havoc on your foes in the ancient land of the giants. Rallos Zek must have guided your blade. (Tenal's voice is suddenly silenced and you feel as if your body is frozen. From Tenal's lips issues a voice that is not his own.) 'Bring this mortal the scales of the children of Veeshan. The red and green as well as my war totem. I will guide your blade.' Your movement returns as Tenal falls to the ground, gasping for breath.");
    quest::doanim(16);
    quest::ding();
    quest::exp(100000);
    quest::summonitem(20681); #Totem of Fiery War
  }
  if (plugin::check_handin(\%itemcount, 20681 => 1, 11622 => 1, 11582 => 1)) { #totem of fiery war, red/green dragons scales
    quest::emote("looks at you oddly as you hand him the scales.");
    quest::say("What are..? 'You have done well, mortal, and you will be rewarded if you are truly brave. Travel to the Plane of Hatred and slay the ancient bard who lives there. Do not return without his hand and this mark or you will never be a true warlord.' Tenal drops to the ground as the last words leave his lips.");
    quest::doanim(16);
    quest::ding();
    quest::exp(100000);
    quest::summonitem(20683); # Mark of the Sword
  }
  if (plugin::check_handin(\%itemcount, 20683 => 1, 20676 => 1)) { #mark of the sword & hand of the maestro
    quest::emote("looks horrified as you give him the hand of the Maestro of Rancor and show him the mark of the sword.  The godlike voice returns, 'You have done well to acquire this. One final task must be completed before you hold the red scabbard in your mortal hands.' Tenal reaches out and hands you a note. 'Take this note and a wingblade of the spirocs to Kargek. When he receives them, I will speak to you one last time.'");
    quest::ding();
    quest::exp(100000);
    quest::summonitem(20684); #Tenal's Note to Kargek
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:eastkarana  ID: 15077 -- Tenal_Redblade

