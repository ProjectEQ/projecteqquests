# Quest for Royal Armorer Slade in Icewell Keep - Custom Crown Quest
# Kiladiveus - created Sub EVENT_ITEM for quest. Used Faction requirement method.
# Kiladiveus - NPC ID:129004 -- Royal_Armorer_Slade, need to change the primary faction to "Coldain"
# items: 31084, 31519, 26025, 2612, 31042, 31518, 25194, 2611, 31000, 31515, 30507, 2610, 31035, 31517, 31021, 31516


sub EVENT_SAY {
  if ($faction <= 3) { # Require warmly and greater faction
    if ($text=~/hail/i) {
      quest::say("Welcome, $name. I'm Slade, Royal Armorer to the Dain and his personal guardsmen. I've heard yer name once or twice in these halls and apparently ye've earned the respect of my people. In light of that I'm willin ta offer my [services] to you if'n ye need them.");
    }
    if ($text=~/services/i) {
      quest::say("If'n ye've had the fortune to earn any of the plate helms that are made by my people in the city then I can use my skills to custom fit and detail it for a $race of yer like. I can do this fer the Dark Runed Crown, the Runed Protector's Helm, the Resonant Helm, the Crown of Forbidden Rites, Crown of the Kromzek Kings, Frostreaver's Velium Crown, Cowl of Mortality, and the Champions Crown. Simply hand me one of these and I'll do the work for you.");
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with my skills.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) { # Require warmly and greater faction
    if (plugin::check_handin(\%itemcount, 31084 => 1)) { # Custom Champions Crown
      quest::summonitem(31519); # Item: Custom Champion's Crown
    }
    elsif (plugin::check_handin(\%itemcount, 26025 => 1)) { # Custom Cowl of Mortalityqu
      quest::summonitem(2612); # Item: Custom Cowl of Mortality
    }
    elsif (plugin::check_handin(\%itemcount, 31042 => 1)) { # Custom Crown of Forbidden Rites
      quest::summonitem(31518); # Item: Custom Crown of Forbidden Rites
    }
    elsif (plugin::check_handin(\%itemcount, 25194 => 1)) { # Custom Crown of the Kromzek Kings
      quest::summonitem(2611); # Item: Custom Crown of the Kromzek Kings
    }
    elsif (plugin::check_handin(\%itemcount, 31000 => 1)) { # Custom Dark Runed Crown
      quest::summonitem(31515); # Item: Custom Dark Runed Crown
    }
    elsif (plugin::check_handin(\%itemcount, 30507 => 1)) { # Custom Frostreavers Velium Crown
      quest::summonitem(2610); # Item: Custom Frostreaver's Velium Crown
    }
    elsif (plugin::check_handin(\%itemcount, 31035 => 1)) { # Custom Resonant Helm
      quest::summonitem(31517); # Item: Custom Resonant Helm
    }
    elsif (plugin::check_handin(\%itemcount, 31021 => 1)) { # Custom Runed Protectors Helm
      quest::summonitem(31516); # Item: Custom Runed Protector's Helm
    }
    else {
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::say("Here you are $name. Ah, a perfect fit! May it serve you well.");
  }	  
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet.");
  }
}

#END of FILE Zone:thurgadinb  ID:129004 -- Royal_Armorer_Slade

