sub EVENT_SPAWN {
 quest::setnexthpevent(80);
if(!defined($qglobals{asentkill})) {
    $altarkill = int(rand(4)) + 1;
    quest::setglobal("asentkill",$altarkill,3,"H6");
  }
  else {
    $altarkill = $qglobals{asentkill};
  }
}

sub EVENT_DEATH {
  if(($class eq "Bard") && ($qglobals{asentkill} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
    }
  elsif(($class eq "Beastlord") && ($qglobals{asentkill} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Berserker") && ($qglobals{asentkill} == 3)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Cleric") && ($qglobals{asentkill} == 4)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Druid") && ($qglobals{asentkill} == 4)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Enchanter") && ($qglobals{asentkill} == 1)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Magician") && ($qglobals{asentkill} == 1)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Monk") && ($qglobals{asentkill} == 3)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Necromancer") && ($qglobals{asentkill} == 1)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Paladin") && ($qglobals{asentkill} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Ranger") && ($qglobals{asentkill} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Rogue") && ($qglobals{asentkill} == 3)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Shadowknight") && ($qglobals{asentkilll} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Shaman") && ($qglobals{asentkill} == 4)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Warrior") && ($qglobals{asentkill} == 3)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  elsif(($class eq "Wizard") && ($qglobals{asentkill} == 1)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h);
  }
  else {
    quest::spawn2(294602,0,0,$x,$y,$z,$h);
    if($altarkill == 1) {
      quest::emote("The creature will perish under the strength of intelligent magic");
    }
    if($altarkill == 2) {
      quest::emote("The creature appears weak to the combined effort of might and magic!");
    }
    if($altarkill == 3) {
      quest::emote("The creature appears weak to the combined effort of strength and cunning!");
    }
    if($altarkill == 4) {
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