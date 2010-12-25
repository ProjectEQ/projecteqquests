my $killshot3;

sub EVENT_SPAWN {
  if(!defined($qglobals{vrexkill3})) {
    $killshot3 = int(rand(16)) + 1;
    quest::setglobal("vrexkill3",$killshot3,3,"H6");
  }
  else {
    $killshot3 = $qglobals{vrexkill3};
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
  if(($class eq "Bard") && ($qglobals{vrexkill3} == 1)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Beastlord") && ($qglobals{vrexkill3} == 2)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Berserker") && ($qglobals{vrexkill3} == 3)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Cleric") && ($qglobals{vrexkill3} == 4)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Druid") && ($qglobals{vrexkill3} == 5)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Enchanter") && ($qglobals{vrexkill3} == 6)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Magician") && ($qglobals{vrexkill3} == 7)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Monk") && ($qglobals{vrexkill3} == 8)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Necromancer") && ($qglobals{vrexkill3} == 9)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Paladin") && ($qglobals{vrexkill3} == 10)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Ranger") && ($qglobals{vrexkill3} == 11)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Rogue") && ($qglobals{vrexkill3} == 12)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Shadowknight") && ($qglobals{vrexkill3} == 13)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Shaman") && ($qglobals{vrexkill3} == 14)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Warrior") && ($qglobals{vrexkill3} == 15)) {
    quest::signalwith(294597,1,0);
  }
  elsif(($class eq "Wizard") && ($qglobals{vrexkill3} == 16)) {
    quest::signalwith(294597,1,0);
  }
  else {
    quest::spawn2(294600,0,0,$x,$y,$z,$h); 
    if($killshot3 == 1) {
      quest::emote("fears a foreboding melody");
    }
    if($killshot3 == 2) {
      quest::emote("fears deep gashes of feral savagery");
    }
    if($killshot3 == 3) {
       quest::emote("shies from heavy blades");
    }
    if($killshot3 == 4) {
       quest::emote("has a dread of celestial spirit");
    }
    if($killshot3 == 5) {
       quest::emote("the creature seems weak in the face of the power of nature");
    }
    if($killshot3 == 6) {
       quest::emote("mind and body vulnerable");
    }
    if($killshot3 == 7) {
       quest::emote("fears summoned elements");
    }
    if($killshot3 == 8) {
       quest::emote("fears focused tranquility");
    }
    if($killshot3 == 9) {
       quest::emote("fears doom of death");
    }
    if($killshot3 == 10) {
       quest::emote("fears a holy blade");
    }
    if($killshot3 == 11) {
       quest::emote("fears true shots and fast blades");
    }
    if($killshot3 == 12) {
       quest::emote("ignores anything behind it");
    }
    if($killshot3 == 13) {
       quest::emote("dreads the strike of dead");
    }
    if($killshot3 == 14) {
       quest::emote("cringes at the appearance of talismans");
    }
    if($killshot3 == 15) {
       quest::emote("fears brute force and brawn");
    }
    if($killshot3 == 16) {
       quest::emote("falters when struck with the power of the elements");
    }
  }
}