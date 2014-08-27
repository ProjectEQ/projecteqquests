sub EVENT_SPAWN {
  quest::setnexthpevent(80);
  if(!defined($qglobals{asentkill2})) {
    $altarkill2 = int(rand(4)) + 1;
    quest::setglobal("asentkill2",$altarkill2,3,"H6");
  }
  else {
    $altarkill2 = $qglobals{asentkill2};
  }
}

sub EVENT_DEATH_COMPLETE {
  if(($class eq "Bard") && ($qglobals{asentkill2} == 2)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
    }
  elsif(($class eq "Beastlord") && ($qglobals{asentkill2} == 2)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Berserker") && ($qglobals{asentkill2} == 3)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Cleric") && ($qglobals{asentkill2} == 4)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Druid") && ($qglobals{asentkill2} == 4)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Enchanter") && ($qglobals{asentkill2} == 1)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Magician") && ($qglobals{asentkill2} == 1)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Monk") && ($qglobals{asentkill2} == 3)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Necromancer") && ($qglobals{asentkill2} == 1)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Paladin") && ($qglobals{asentkill2} == 2)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Ranger") && ($qglobals{asentkill2} == 2)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Rogue") && ($qglobals{asentkill2} == 3)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Shadowknight") && ($qglobals{asentkilll2} == 2)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Shaman") && ($qglobals{asentkill2} == 4)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Warrior") && ($qglobals{asentkill2} == 3)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Wizard") && ($qglobals{asentkill2} == 1)) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h);
  }
  else {
    quest::spawn2(294603,0,0,$x,$y,$z,$h);
    if($altarkill2 == 1) {
      quest::emote("The creature will perish under the strength of intelligent magic");
    }
    if($altarkill2 == 2) {
      quest::emote("The creature appears weak to the combined effort of might and magic!");
    }
    if($altarkill2 == 3) {
      quest::emote("The creature appears weak to the combined effort of strength and cunning!");
    }
    if($altarkill2 == 4) {
      quest::emote("The creature cannot stand up to the power of healers");
    }
  }
}

sub EVENT_HP {
  if($hpevent == 80) {
    $npc->WipeHateList();
    quest::setnexthpevent(60);
    quest::emote("changes target");
  }
  if($hpevent == 60) {
    $npc->WipeHateList();
    quest::setnexthpevent(40);
    quest::emote("changes target");
  }
  if($hpevent == 40) {
    $npc->WipeHateList();
    quest::setnexthpevent(20);
    quest::emote("changes target");
  }
  if($hpevent == 20) {
    $npc->WipeHateList();
  }
}
