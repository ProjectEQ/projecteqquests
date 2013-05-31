sub EVENT_SPAWN {
if(!defined($qglobals{marakill})) {
    $archkill = int(rand(4)) + 1;
    quest::setglobal("marakill",$archkill,3,"H6");
  }
  else {
    $archkill = $qglobals{marakill};
  }
}
sub EVENT_AGGRO {
  quest::settimer(1,1);
  quest::settimer(2,45);
}

sub EVENT_TIMER {
  if(($timer == 1) && ($x > 720 || $x < 500 || $y < -300 || $y > -120)) {
    $npc->GMMove(531,-157,-49,126);
  }
  if($timer == 2) {
    quest::emote("shudders as if somehow changing.");
    if($qglobals{marakill} == 1) {
    quest::setglobal("marakill",2,3,"H6");
    }
    elsif($qglobals{marakill} == 2) {
    quest::setglobal("marakill",3,3,"H6");
    }
    elsif($qglobals{marakill} == 3) {
    quest::setglobal("marakill",4,3,"H6");
    }
    elsif($qglobals{marakill} == 4) {
    quest::setglobal("marakill",1,3,"H6");
    }
  }
}

sub EVENT_DEATH {
  if((($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Wizard")) && ($qglobals{marakill} == 1)) {
    quest::spawn2(294595,0,0,480,-592,-50,64);
	quest::delglobal("marakill");
  }  
  elsif((($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") || ($class eq "Shadowknight")) && ($qglobals{marakill} == 2)) {
    quest::spawn2(294595,0,0,480,-592,-50,64);
	quest::delglobal("marakill");
  }
  elsif((($class eq "Berserker") || ($class eq "Monk") || ($class eq "Rogue") || ($class eq "Warrior")) && ($qglobals{marakill} == 3)) {
    quest::spawn2(294595,0,0,480,-592,-50,64);
	quest::delglobal("marakill");
  }
  elsif((($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) && ($qglobals{marakill} == 4)) {
    quest::spawn2(294595,0,0,480,-592,-50,64);
	quest::delglobal("marakill");
  }
  else {
    quest::spawn2(294594,0,0,$x,$y,$z,$h);
     if($archkill == 1) {
      quest::emote("The creature will perish under the strength of intelligent magic");
    }
    if($archkill == 2) {
      quest::emote("The creature appears weak to the combined effort of might and magic!");
    }
    if($archkill == 3) {
      quest::emote("The creature appears weak to the combined effort of strength and cunning!");
    }
    if($archkill == 4) {
      quest::emote("The creature cannot stand up to the power of healers");
    }  
  }
}

