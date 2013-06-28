my $killshot2;

sub EVENT_SPAWN {
  if(!defined($qglobals{vrexkill2})) {
    $killshot2 = int(rand(16)) + 1;
    quest::setglobal("vrexkill2",$killshot2,3,"H6");
  }
  else {
    $killshot2 = $qglobals{vrexkill2};
  }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if ($x > 720 || $x < 500 || $y < -300 || $y > -120) {
    $npc->GMMove(531,-157,-49,126);
  }
}

sub EVENT_DEATH_COMPLETE {
  if(($class eq "Bard") && ($qglobals{vrexkill2} == 1)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Beastlord") && ($qglobals{vrexkill2} == 2)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Berserker") && ($qglobals{vrexkill2} == 3)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Cleric") && ($qglobals{vrexkill2} == 4)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Druid") && ($qglobals{vrexkill2} == 5)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Enchanter") && ($qglobals{vrexkill2} == 6)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Magician") && ($qglobals{vrexkill2} == 7)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Monk") && ($qglobals{vrexkill2} == 8)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Necromancer") && ($qglobals{vrexkill2} == 9)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Paladin") && ($qglobals{vrexkill2} == 10)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Ranger") && ($qglobals{vrexkill2} == 11)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Rogue") && ($qglobals{vrexkill2} == 12)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Shadowknight") && ($qglobals{vrexkill2} == 13)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Shaman") && ($qglobals{vrexkill2} == 14)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Warrior") && ($qglobals{vrexkill2} == 15)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Wizard") && ($qglobals{vrexkill2} == 16)) {
    quest::signalwith(294597,1,0);
  }
  else {
    quest::spawn2(294598,0,0,$x,$y,$z,$h); 
    if($killshot2 == 1) {
      quest::emote("fears a foreboding melody");
    }
    if($killshot2 == 2) {
      quest::emote("fears deep gashes of feral savagery");
    }
    if($killshot2 == 3) {
       quest::emote("shies from heavy blades");
    }
    if($killshot2 == 4) {
       quest::emote("has a dread of celestial spirit");
    }
    if($killshot2 == 5) {
       quest::emote("the creature seems weak in the face of the power of nature");
    }
    if($killshot2 == 6) {
       quest::emote("mind and body vulnerable");
    }
    if($killshot2 == 7) {
       quest::emote("fears summoned elements");
    }
    if($killshot2 == 8) {
       quest::emote("fears focused tranquility");
    }
    if($killshot2 == 9) {
       quest::emote("fears doom of death");
    }
    if($killshot2 == 10) {
       quest::emote("fears a holy blade");
    }
    if($killshot2 == 11) {
       quest::emote("fears true shots and fast blades");
    }
    if($killshot2 == 12) {
       quest::emote("ignores anything behind it");
    }
    if($killshot2 == 13) {
       quest::emote("dreads the strike of dead");
    }
    if($killshot2 == 14) {
       quest::emote("cringes at the appearance of talismans");
    }
    if($killshot2 == 15) {
       quest::emote("fears brute force and brawn");
    }
    if($killshot2 == 16) {
       quest::emote("falters when struck with the power of the elements");
    }
  }
}
