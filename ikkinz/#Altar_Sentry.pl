sub EVENT_SPAWN {
 quest::setnexthpevent(80);
if(!defined($qglobals{$instanceid.asentkill})) {
    $altarkill = int(rand(4)) + 1;
    quest::setglobal($instanceid.asentkill,$altarkill,3,"H6");
  }
  else {
    $altarkill = $qglobals{$instanceid.asentkill};
  }
}

sub EVENT_DEATH_COMPLETE {
  if ( $status >= 80 ) {
    quest::spawn2(294628,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Bard") && ($qglobals{$instanceid.asentkill} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Beastlord") && ($qglobals{$instanceid.asentkill} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Berserker") && ($qglobals{$instanceid.asentkill} == 3)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Cleric") && ($qglobals{$instanceid.asentkill} == 4)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Druid") && ($qglobals{$instanceid.asentkill} == 4)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Enchanter") && ($qglobals{$instanceid.asentkill} == 1)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Magician") && ($qglobals{$instanceid.asentkill} == 1)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Monk") && ($qglobals{$instanceid.asentkill} == 3)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Necromancer") && ($qglobals{$instanceid.asentkill} == 1)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Paladin") && ($qglobals{$instanceid.asentkill} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Ranger") && ($qglobals{$instanceid.asentkill} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Rogue") && ($qglobals{$instanceid.asentkill} == 3)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Shadowknight") && ($qglobals{$instanceid.asentkilll} == 2)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Shaman") && ($qglobals{$instanceid.asentkill} == 4)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Warrior") && ($qglobals{$instanceid.asentkill} == 3)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  elsif(($class eq "Wizard") && ($qglobals{$instanceid.asentkill} == 1)) {
    quest::spawn2(294627,0,0,$x,$y,$z,$h); # NPC: a_pile_of_bones
	quest::ze(0,"The stone worker crumbles to the ground, its energy drained.");
  }
  else {
    quest::spawn2(294602,0,0,$x,$y,$z,$h); # NPC: #Altar_Sentry
	quest::ze(0,"Your energy didn't match that required to kill the stone worker.");
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
	quest::ze(0,"It reforms instantly!");
  }
  quest::signalwith(294614, 1, 0); # NPC: #Trigger_Ikkinz_4
}
sub EVENT_HP {
  if($hpevent == 80) {
   $npc->WipeHateList();
   quest::setnexthpevent(60);
   quest::emote("focuses its attention on someone new!");
   }
  if($hpevent == 60) {
   $npc->WipeHateList();
   quest::setnexthpevent(40);
   quest::emote("focuses its attention on someone new!");
   }
   if($hpevent == 40) {
   $npc->WipeHateList();
   quest::setnexthpevent(20);
   quest::emote("focuses its attention on someone new!");   
   }
   if($hpevent == 20) {
   $npc->WipeHateList();
    }
}
