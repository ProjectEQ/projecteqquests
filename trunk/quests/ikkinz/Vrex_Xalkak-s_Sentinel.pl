my $killshot;

sub EVENT_SPAWN {
  if(!defined($qglobals{vrexkill1})) {
    $killshot = int(rand(16)) + 1;
    quest::setglobal("vrexkill1",$killshot,0,"H6");
  }
  else {
    $killshot = $qglobals{vrexkill1};
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
  if(($class eq "Bard") && ($qglobals{vrexkill1} == 1)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Beastlord") && ($qglobals{vrexkill1} == 2)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Berserker") && ($qglobals{vrexkill1} == 3)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Cleric") && ($qglobals{vrexkill1} == 4)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Druid") && ($qglobals{vrexkill1} == 5)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Enchanter") && ($qglobals{vrexkill1} == 6)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Magician") && ($qglobals{vrexkill1} == 7)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Monk") && ($qglobals{vrexkill1} == 8)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Necromancer") && ($qglobals{vrexkill1} == 9)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Paladin") && ($qglobals{vrexkill1} == 10)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Ranger") && ($qglobals{vrexkill1} == 11)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Rogue") && ($qglobals{vrexkill1} == 12)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Shadowknight") && ($qglobals{vrexkill1} == 13)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Shaman") && ($qglobals{vrexkill1} == 14)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Warrior") && ($qglobals{vrexkill1} == 15)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Wizard") && ($qglobals{vrexkill1} == 16)) {
    quest::signalwith(294597,1,0);
  }
  else {
    quest::spawn2(294593,0,0,531,-157,-49,126); 
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