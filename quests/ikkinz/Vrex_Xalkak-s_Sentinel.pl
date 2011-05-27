my $killshot1;

sub EVENT_SPAWN {
  if(!defined($qglobals{vrexkill1})) {
    $killshot1 = int(rand(16)) + 1;
    quest::setglobal("vrexkill1",$killshot1,3,"H6");
  }
  else {
    $killshot1 = $qglobals{vrexkill1};
  }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 720 || $x < 500 || $y < -300 || $y > -120) {
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
    quest::spawn2(294593,0,0,$x,$y,$z,$h); 
    if($killshot1 == 1) {
      quest::emote("fears a foreboding melody");
    }
    if($killshot1 == 2) {
      quest::emote("fears deep gashes of feral savagery");
    }
    if($killshot1 == 3) {
       quest::emote("shies from heavy blades");
    }
    if($killshot1 == 4) {
       quest::emote("has a dread of celestial spirit");
    }
    if($killshot1 == 5) {
       quest::emote("the creature seems weak in the face of the power of nature");
    }
    if($killshot1 == 6) {
       quest::emote("mind and body vulnerable");
    }
    if($killshot1 == 7) {
       quest::emote("fears summoned elements");
    }
    if($killshot1 == 8) {
       quest::emote("fears focused tranquility");
    }
    if($killshot1 == 9) {
       quest::emote("fears doom of death");
    }
    if($killshot1 == 10) {
       quest::emote("fears a holy blade");
    }
    if($killshot1 == 11) {
       quest::emote("fears true shots and fast blades");
    }
    if($killshot1 == 12) {
       quest::emote("ignores anything behind it");
    }
    if($killshot1 == 13) {
       quest::emote("dreads the strike of dead");
    }
    if($killshot1 == 14) {
       quest::emote("cringes at the appearance of talismans");
    }
    if($killshot1 == 15) {
       quest::emote("fears brute force and brawn");
    }
    if($killshot1 == 16) {
       quest::emote("falters when struck with the power of the elements");
    }
  }
}