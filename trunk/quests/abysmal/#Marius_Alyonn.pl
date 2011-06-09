# Helmet Eclipsing Liquidation Machine (H.E.L.M.)
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (defined($qglobals{qvichelmchange}) && ($qglobals{qvichelmchange} == 1)) {
      quest::emote("looks at $name and begins to speak.");
      quest::say("Ah, so I see you have returned. Do you wish to change your headgear back? Or are you here to alter another? Either way, I am going to have to charge you a small [fee] this time. I am planning to sell this invention in Norrath and beyond, but I need to save a little more money first.");  
    }
    else {
      quest::emote("looks at $name and begins to speak.");  
      quest::say("Come to exchange your [helm] or you just like looking at gnomes?");  
    }
  }
  if ($text=~/helm/i){
    quest::say("Yes that's what I said. I have been working with the dwarves to create a device that can alter the view of your headgear. This advanced gnomish technology, that's right gnomish technology, will remove the shroud that makes your helm invisible to the naked eye. It can also replace the shroud if you decide you don't like it being shown. Amazing isn't it? And it was all my design! The only drawback to this device, appropriately named the Helmet Eclipsing Liquidation Machine or H.E.L.M. for short, is that it is only compatible with certain [headgear].");  
  }
  if ($text=~/headgear/i){
    quest::say("Well, so far I have only been successful with the latest class quest helms but I am hoping to expand soon. For now though if you have any of these and wish to try my machine out, then hand it over and let the show begin.");  
  }
  if (defined($qglobals{qvichelmchange}) && ($qglobals{qvichelmchange} == 1)) {
    if ($text=~/fee/i) {
      quest::say("'Hmm, let me see, the cost of materials, having to perform maintenance after the process is done, opening the item and closing it again, plus a small labor charge. I think a diamond sounds fair, what do you say [yes] or [no]");  
    }
    if ($text=~/yes/i) {
      quest::say("Good, then please hand the gem and I will give you my latest version of the H.E.L.M. device that you can use at your leisure. But before you give me the diamond remember that this device is only compatible with the latest class quest helms.");  
    }
    if ($text=~/no/i) {
      quest::say("Then please stop standing there looking at me like a peice of meat.");  
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10037 => 1)) { # diamond
    quest::say("Here is the latest version of my H.E.L.M device.");  
    quest::summonitem(67735); # Disposable H.E.L.M Device 
  }
  elsif (plugin::check_handin(\%itemcount, 67720 => 1)) { # Dakkamor's Helm of the Divine 
    quest::emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
    quest::say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
    quest::setglobal("qvichelmchange", 1, 5, "F");
    quest::summonitem(68855); # Dakkamor's Helm of the Divine
  }
  elsif (plugin::check_handin(\%itemcount, 67729 => 1)) { # Gaelin's Woodland Cap 
    quest::emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
    quest::say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
    quest::setglobal("qvichelmchange", 1, 5, "F");
    quest::summonitem(68900); # Gaelin's Woodland Cap
  }
  elsif (plugin::check_handin(\%itemcount, 67732 => 1)) { # Jennu's Circlet of Creation 
    quest::emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
    quest::say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
    quest::setglobal("qvichelmchange", 1, 5, "F");
    quest::summonitem(68915); # Jennu's Circlet of Creation
  }
  elsif (plugin::check_handin(\%itemcount, 67726 => 1)) { # Kanleku's Helm of Spirits 
    quest::emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
    quest::say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
    quest::setglobal("qvichelmchange", 1, 5, "F");
    quest::summonitem(68885); # Kanleku's Helm of Spirits
  }
  elsif (plugin::check_handin(\%itemcount, 67733 => 1)) { # Nolaen's Lifereaper Circlet 
    quest::emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
    quest::say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
    quest::setglobal("qvichelmchange", 1, 5, "F");
    quest::summonitem(68920); # Nolaen's Lifereaper Circlet
  }
  elsif (plugin::check_handin(\%itemcount, 67731 => 1)) { # Nunkin's Circlet of Pure Elements 
    quest::emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
    quest::say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
    quest::setglobal("qvichelmchange", 1, 5, "F");
    quest::summonitem(68910); # Nunkin's Circlet of Pure Elements
  }
  elsif (plugin::check_handin(\%itemcount, 67728 => 1)) { # Pressl's Cap of Balance 
    quest::emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
    quest::say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
    quest::setglobal("qvichelmchange", 1, 5, "F");
    quest::summonitem(68895); # Pressl's Cap of Balance
  }
  elsif (plugin::check_handin(\%itemcount, 67721 => 1)) { # Trimdet's Helm of Chivalry 
    quest::emote("Marius Alyonn pulls a small item out of his pocket places it on the floor and stands back as it starts to unfold, revealing what looks to be a modified forge. Placing the helm inside the forge, Marius pulls a small lever on the side, removes the helm from within, and hands it to you.");
    quest::say("There you go! Let me know what you think. If you don't like it, you can always come back, but it will cost you. This type of technology does not come cheap you know.");  
    quest::setglobal("qvichelmchange", 1, 5, "F");
    quest::summonitem(68860); # Trimdet's Helm of Chivalry
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
# END of FILE Zone:abysmal  ID:279039 -- #Marius_Alyonn.pl