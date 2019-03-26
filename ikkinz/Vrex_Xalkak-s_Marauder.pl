my $archkill;

sub EVENT_SPAWN {
    quest::settimer(2,75);
  if(!defined($qglobals{$instanceid.marakill})) {
    $archkill = int(rand(4)) + 1;
    quest::setglobal($instanceid.marakill,$archkill,3,"H6");
  }
  else {
    $archkill = $qglobals{$instanceid.marakill};
  }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if(($timer == 1) && ($x > 720 || $x < 500 || $y < -300 || $y > -120)) {
    $npc->GMMove(531,-157,-49,252);
  }
  if($timer == 2) {
    quest::ze(15,"The creature shudders as if somehow changing.");
    if(defined($qglobals{$instanceid.marakill}) && $qglobals{$instanceid.marakill} == 1) {
      quest::setglobal($instanceid.marakill,2,3,"H6");
	  $archkill = $qglobals{$instanceid.marakill};
    }
    if(defined($qglobals{$instanceid.marakill}) && $qglobals{$instanceid.marakill} == 2) {
      quest::setglobal($instanceid.marakill,3,3,"H6");
	  $archkill = $qglobals{$instanceid.marakill};
    }
    if(defined($qglobals{$instanceid.marakill}) && $qglobals{$instanceid.marakill} == 3) {
      quest::setglobal($instanceid.marakill,4,3,"H6");
	  $archkill = $qglobals{$instanceid.marakill};
    }
    if(defined($qglobals{$instanceid.marakill}) && $qglobals{$instanceid.marakill} == 4) {
      quest::setglobal($instanceid.marakill,1,3,"H6");
	  $archkill = $qglobals{$instanceid.marakill};
    }
  }
}

sub EVENT_DEATH_COMPLETE {
  if((($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Wizard")) && ($qglobals{$instanceid.marakill} == 1)) {
    quest::spawn2(294595,0,0,480,-592,-50,128); # NPC: #Vrex_Xalkak_Nixki
	quest::delglobal($instanceid.marakill);
	quest::ze(15,"The marauder's remains crash to the ground. It is no more.");
  }  
  elsif((($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") || ($class eq "Shadowknight")) && ($qglobals{$instanceid.marakill} == 2)) {
    quest::spawn2(294595,0,0,480,-592,-50,128); # NPC: #Vrex_Xalkak_Nixki
	quest::delglobal($instanceid.marakill);
	quest::ze(15,"The marauder's remains crash to the ground. It is no more.");
  }
  elsif((($class eq "Berserker") || ($class eq "Monk") || ($class eq "Rogue") || ($class eq "Warrior")) && ($qglobals{$instanceid.marakill} == 3)) {
    quest::spawn2(294595,0,0,480,-592,-50,128); # NPC: #Vrex_Xalkak_Nixki
	quest::delglobal($instanceid.marakill);
	quest::ze(15,"The marauder's remains crash to the ground. It is no more.");
  }
  elsif((($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) && ($qglobals{$instanceid.marakill} == 4)) {
    quest::spawn2(294595,0,0,480,-592,-50,128); # NPC: #Vrex_Xalkak_Nixki
	quest::delglobal($instanceid.marakill);
	quest::ze(15,"The marauder's remains crash to the ground. It is no more.");
  }
  else {
	quest::ze(15,"Your energy didn't match that required to kill the stone worker.");
    quest::spawn2(294594,0,0,$x,$y,$z,$h); # NPC: Vrex_Xalkak`s_Marauder
     if($archkill == 1) {
      quest::ze(15,"The creature will perish under the strength of intelligent magic");
    }
    if($archkill == 2) {
      quest::ze(15,"The creature appears weak to the combined effort of might and magic!");
    }
    if($archkill == 3) {
      quest::ze(15,"The creature appears weak to the combined effort of strength and cunning!");
    }
    if($archkill == 4) {
      quest::ze(15,"The creature cannot stand up to the power of healers");
    } 
	quest::ze(15,"It reforms instantly!");
  }
}

