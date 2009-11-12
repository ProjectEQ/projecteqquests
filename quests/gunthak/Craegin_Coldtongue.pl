#zone: gunthak NPC: Craegin_Coldtongue (224195)
#Started by Angelox, finished by Kilelen
#Beastlord Spells (LoY)

sub EVENT_SAY {
  if ($class eq "Beastlord") {
    if ($text=~/hail/i) {
      quest::emote("glances at you with eyes of energy. He peers across your armor and then finally seems to come to a decision and points to the ground. He kneels down and then begins to draw something in the dirt. You see the outline of a wolf begin to take shape. You then see a humanoid figure standing next to the animal. He draws a circle around them, presumably to show that they are connected somehow. Craegin looks up at you and points to the wolf and then at you. You think he is asking if you are a Beastlord. His gaze pierces your eyes waiting for an answer.");
    }
    if ($text=~/beastlord/i) {
      quest::emote("nods quickly and begins to draw again in the sand. He points at the humanoid figure and then at himself. Apparently he has drawn himself. He looks up at you and you nod back in understanding. He points to the wolf and then points out onto the island. He grabs a handful of dust and blows it across the wolf's picture. Perhaps his [warder] is sick and lost on the island somewhere. He looks as if he might want to [draw] more.");
    }
    if ($text=~/draw more about your warder/i) {
      quest::emote("nods furiously. He begins drawing again in the sand. you see some sort of spear being thrown at the wolf. He then draws a collar of some sort and then draws an arrow to the wolf. Apparently his warder has been injured and captured somehow by something on the island. You can see the pain in the barbarian's eyes as he looks at you hopefully. He hands you a small emblem of some kind and points towards the island.");
      quest::summonitem(59032); #A stone emblem
    }
    if (($text=~/draw for me/i) && defined($qglobals{CraeginA}) && ($qglobals{CraeginA} == 1)) {
      quest::emote("kneels to the ground once more and begins to draw. He draws the picture of a skull in the dirt and then draws several squiggly lines beneath. You begin to realize he's describing a cave system beneath the island.");
    }
    if ($text=~/cave system/i && defined($qglobals{CraeginA}) && ($qglobals{CraeginA} == 1)) {
      quest::emote("nods at you. He reaches for a bag at his waist and pulls out a few grains of fine black powder. He rubs the black powder carefully across the cave sketch. He makes a sort of digging motion with his hands and points back toward the island. He must have found the black powder in the cave system on the island somewhere.");
    }
  }
  else {
    quest::emote("shivers quietly. You have a hard time believing that a barbarian of his stature could possibly think this climate to be cold. He stares into your eyes for a moment and then shuffles away.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 59033 => 1)) { #A glowing collar
    quest::emote("looks at you in amazement as you hand the glowing collar to him. He looks as if he might weep for joy at any moment. He holds the collar firmly by the clasp and brings it down to his side. He mumbles some words and the wolf immediately appears beside him. He reaches into his bags and grabs a small stone similar to the one fit into the collar. You reach forward and take it from him. He points at the dirt once more as if he wishes to [draw] something for you.");
    quest::summonitem(59010);#Spell: Bond of the Wild
    quest::setglobal("CraeginA",1,0,"F");
  }	
  elsif(plugin::check_handin(\%itemcount, 59034 => 1) && defined($qglobals{CraeginA}) && ($qglobals{CraeginA} == 1)) { #A strange dark powder
    quest::emote("looks over the dark powder carefully for a moment and then nods at you. He grabs a small bag from his waist and places the dust inside of it. He then takes a second bag and empties another odd powder into the bag. He closes and shakes the bag vehemently and then looks at you expectantly. You nod. He reaches into the bag and pulls a bit of the mixtures out. Unexpectedly he blows the mixture into your face, causing your eyes to burn and your lungs to uncontrollably cough in pain. You fall to the ground for a moment, but the burning subsides. You rise back to your feet and Craegin hands you the rest of the bag of powder.");
    quest::summonitem(59009);#Spell: Malaria
    quest::delglobal("CraeginA");
  }	
  else {
    quest::emote("ignores you."); #emote made up
    plugin::return_items(\%itemcount);
  }
}
#Done