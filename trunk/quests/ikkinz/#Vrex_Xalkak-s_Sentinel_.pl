my $killshot;

sub EVENT_SPAWN {
  if(!defined($qglobals{vrexkill4})) {
    $killshot = int(rand(16)) + 1;
    quest::setglobal("vrexkill4",$killshot,3,"H6");
  }
  else {
    $killshot = $qglobals{vrexkill4};
  }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 720) {
    $npc->GMMove(531,-157,-49,126);
  }
}

sub EVENT_DEATH {
  if(($class eq "Bard") && ($qglobals{vrexkill4} == 1)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Beastlord") && ($qglobals{vrexkill4} == 2)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Berserker") && ($qglobals{vrexkill4} == 3)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Cleric") && ($qglobals{vrexkill4} == 4)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Druid") && ($qglobals{vrexkill4} == 5)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Enchanter") && ($qglobals{vrexkill4} == 6)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Magician") && ($qglobals{vrexkill4} == 7)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Monk") && ($qglobals{vrexkill4} == 8)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Necromancer") && ($qglobals{vrexkill4} == 9)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Paladin") && ($qglobals{vrexkill4} == 10)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Ranger") && ($qglobals{vrexkill4} == 11)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Rogue") && ($qglobals{vrexkill4} == 12)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Shadowknight") && ($qglobals{vrexkill4} == 13)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Shaman") && ($qglobals{vrexkill4} == 14)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Warrior") && ($qglobals{vrexkill4} == 15)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Wizard") && ($qglobals{vrexkill4} == 16)) {
    quest::signalwith(294597,1,0);
  }
  else {
    quest::spawn2(294593,0,0,$x,$y,$z,$h); 
    if($killshot == 1) {
      quest::emote("fears a foreboding melody");
    }
    if($killshot == 2) {
      quest::emote("fears deep gashes of feral savagery");
    }
    if($killshot == 3) {
       quest::emote("shies from heavy blades");
    }
    if($killshot == 4) {
       quest::emote("has a dread of celestial spirit");
    }
    if($killshot == 5) {
       quest::emote("the creature seems weak in the face of the power of nature");
    }
    if($killshot == 6) {
       quest::emote("mind and body vulnerable");
    }
    if($killshot == 7) {
       quest::emote("fears summoned elements");
    }
    if($killshot == 8) {
       quest::emote("fears focused tranquility");
    }
    if($killshot == 9) {
       quest::emote("fears doom of death");
    }
    if($killshot == 10) {
       quest::emote("fears a holy blade");
    }
    if($killshot == 11) {
       quest::emote("fears true shots and fast blades");
    }
    if($killshot == 12) {
       quest::emote("ignores anything behind it");
    }
    if($killshot == 13) {
       quest::emote("dreads the strike of dead");
    }
    if($killshot == 14) {
       quest::emote("cringes at the appearance of talismans");
    }
    if($killshot == 15) {
       quest::emote("fears brute force and brawn");
    }
    if($killshot == 16) {
       quest::emote("falters when struck with the power of the elements");
    }
  }
}