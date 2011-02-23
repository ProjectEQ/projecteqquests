#BEGIN File: hollowshade/War_Trigger.pl (166257)
#Quest file for Hollowshade Moor - Hollowshade War

#Rewrite in progress!

my $attacker = "";
my $attacker_id = 0;
my $defender = "";
my $defender_id = 0;
my $event = 0;
my $RandomWar = 0;
my %HollowshadeRace = (1 => "Owlbear", 2 => "Sonic Wolves", 3 => "Grimlings");
my %Camp = (1 => "North", 2 => "East", 3 => "South");
my %DirectionalCamp = (1 => "northern caves", 2 => "eastern swamp", 3 => "southern shores");
my %AttackerText = (
  "Owlbear" => "Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.",
  "Sonic Wolves" => "Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.",
  "Grimlings" => "Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy."
);
my %DefenderText = (
  1 => "frantically prepare for the assault",
  2 => "seem disoriented",
  3 => "nervously scurry about"
);
my %VictoryText = (
  "Owlbear" => "The Owlbear chase off any remaining survivors as they lay claim to the ",
  "Sonic Wolves" => "Sonic wolves howl in celebration, having overrun the inhabitants of the ",
  "Grimlings" => "NEED GRIMLING VICTORY TEXT"
);

sub EVENT_SPAWN {
  if (!defined($qglobals{HollowshadeNorth}) || !defined($qglobals{HollowshadeEast}) || !defined($qglobals{HollowshadeSouth})) {
    RESET_GLOBALS();
  }
  RESET_ZONE();
}

sub EVENT_TIMER {
  if (($timer eq "RandomWar") && ($event == 0)) {
    SEND_ATTACKER();
  }
  if ($timer eq "ResetPause") {
    quest::stoptimer("ResetPause");
    LOAD_SPAWNS();
  }
  if ($timer eq "Attack") {
    quest::stoptimer("Attack");
    quest::depopall($attacker_id);
    quest::depopall($defender_id);
    $event = 0;
  }
}

sub EVENT_SIGNAL {
  $event = 0;
  quest::stoptimer("Attack");

  if ($signal == 1) { #North Camp Overrun
    quest::spawn_condition($zonesn, $qglobals{HollowshadeNorth}, 0); #Despawn Loser
    quest::setglobal("HollowshadeNorth", $qglobals{$attacker}, 0, "F"); #Set Winner
    quest::spawn_condition($zonesn, $qglobals{$attacker}, 1); #Spawn Winner
    if ($qglobals{HollowshadeEast} == $qglobals{HollowshadeSouth}) {
      #Spawn Boss
      $event = 1;
      RESET_GLOBALS();
    }
  }
  if ($signal == 2) { #East Camp Overrun
    quest::spawn_condition($zonesn, $qglobals{HollowshadeEast} + 3, 0); #Despawn Loser
    quest::setglobal("HollowshadeEast", $qglobals{$attacker}, 0, "F"); #Set Winner
    quest::spawn_condition($zonesn, $qglobals{$attacker} + 3, 1); #Spawn Winner
    if ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeSouth}) {
      #Spawn Boss
      $event = 1;
      RESET_GLOBALS();
    }
  }
  if ($signal == 3) { #South Camp Overrun
    quest::spawn_condition($zonesn, $qglobals{HollowshadeSouth} + 6, 0); #Despawn Loser
    quest::setglobal("HollowshadeSouth", $qglobals{$attacker}, 0, "F"); #Set Winner
    quest::spawn_condition($zonesn, $qglobals{$attacker} + 6, 1); #Spawn Winner
    if ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeEast}) {
      #Spawn Boss
      $event = 1;
      RESET_GLOBALS();
    }
  }
  if ($signal == 4) { #Boss Dead
    RESET_ZONE();
  }
}

sub RESET_GLOBALS {
  quest::setglobal("HollowshadeNorth", 1, 0, "F"); #Owlbear in the North
  quest::setglobal("HollowshadeEast",  2, 0, "F"); #Sonic Wolves in the East
  quest::setglobal("HollowshadeSouth", 3, 0, "F"); #Grimlings in the South
}

sub RESET_ZONE {
  quest::ze(15, "Zone resetting now.");
  $attacker = "";
  $defender = "";
  $event = 0;
  $RandomWar = plugin::RandomRange(720, 3600);
  quest::spawn_condition($zonesn, 1, 0);
  quest::spawn_condition($zonesn, 2, 0);
  quest::spawn_condition($zonesn, 3, 0);
  quest::spawn_condition($zonesn, 4, 0);
  quest::spawn_condition($zonesn, 5, 0);
  quest::spawn_condition($zonesn, 6, 0);
  quest::spawn_condition($zonesn, 7, 0);
  quest::spawn_condition($zonesn, 8, 0);
  quest::spawn_condition($zonesn, 9, 0);
  quest::settimer("ResetPause", 5);
}

sub LOAD_SPAWNS {
  quest::spawn_condition($zonesn, $qglobals{HollowshadeNorth}    , 1);
  quest::spawn_condition($zonesn, $qglobals{HollowshadeEast}  + 3, 1);
  quest::spawn_condition($zonesn, $qglobals{HollowshadeSouth} + 6, 1);
  quest::settimer("RandomWar", $RandomWar);
}

sub SEND_ATTACKER {
  $attacker = quest::ChooseRandom("HollowshadeNorth", "HollowshadeEast", "HollowshadeSouth");
  $event = 1;

  #Select attacker and defender
  if ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeEast}) {
    if (($attacker eq "HollowshadeNorth") || ($attacker eq "HollowshadeEast")) {
      $defender = "HollowshadeSouth";
    }
    else {
      $defender = quest::ChooseRandom("HollowshadeNorth", "HollowshadeEast");
    }
  }
  elsif ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeSouth}) {
    if (($attacker eq "HollowshadeNorth") || ($attacker eq "HollowshadeSouth")) {
      $defender = "HollowshadeEast";
    }
    else {
      $defender = quest::ChooseRandom("HollowshadeNorth", "HollowshadeSouth");
    }
  }
  elsif ($qglobals{HollowshadeSouth} == $qglobals{HollowshadeEast}) {
    if (($attacker eq "HollowshadeEast") || ($attacker eq "HollowshadeSouth")) {
      $defender = "HollowshadeNorth";
    }
    else {
      $defender = quest::ChooseRandom("HollowshadeEast", "HollowshadeSouth");
    }
  }
  else {
    if ($attacker eq "HollowshadeNorth") {
      $defender = quest::ChooseRandom("HollowshadeEast", "HollowshadeSouth");
    }
    elsif ($attacker eq "HollowshadeEast") {
      $defender = quest::ChooseRandom("HollowshadeNorth", "HollowshadeSouth");
    }
    else {
      $defender = quest::ChooseRandom("HollowshadeNorth", "HollowshadeEast");
    }
  }

  #Spawn attackers
  if ($attacker eq "HollowshadeNorth") { #spawn northern attackers
    if ($qglobals{$attacker} == 1) { #Owlbear attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
    elsif ($qglobals{$attacker} == 2) { #Sonic Wolf attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
    else { #Grimling attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
  }
  elsif ($attacker eq "HollowshadeEast") { #spawn eastern attackers
    if ($qglobals{$attacker} == 4) { #Owlbear attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
    elsif ($qglobals{$attacker} == 5) { #Sonic Wolf attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
    else { #Grimling attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
  }
  else { #spawn southern attackers
    if ($qglobals{$attacker} == 7) { #Owlbear attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
    elsif ($qglobals{$attacker} == 8) { #Sonic Wolf attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
    else { #Grimling attackers
      #quest::spawn2(00000,1,0,x,y,z,h);
      #quest::spawn2(00000,2,0,x,y,z,h);
      #quest::spawn2(00000,3,0,x,y,z,h);
      #quest::spawn2(00000,4,0,x,y,z,h);
    }
  }

  #Spawn defenders
  if (($qglobals{$defender} == 1) || ($qglobals{$defender} == 4) || ($qglobals{$defender} == 7)) {
    $defender_id = 166242; #an_owlbear_defender
  }
  elsif (($qglobals{$defender} == 2) || ($qglobals{$defender} == 5) || ($qglobals{$defender} == 8)) {
    $defender_id = 166264; #a_sonic_defender
  }
  else {
    $defender_id = 166238; #a_grimling_defender
  }
  if ($defender eq "HollowshadeNorth") { #spawn northern defenders
    quest::spawn2($defender_id,0,0,1103,2134,137,182);
    quest::spawn2($defender_id,0,0,1137,2109,143,178);
    quest::spawn2($defender_id,0,0,1129,2166,143,187);
    quest::spawn2($defender_id,0,0,1162,2191,170,172);
    quest::spawn2($defender_id,0,0,1188,2098,165,180);
  }
  elsif ($defender eq "HollowshadeEast") { #spawn eastern defenders
    quest::spawn2($defender_id,0,0,-2704,541,46,39);
    quest::spawn2($defender_id,0,0,-2730,592,48,60);
    quest::spawn2($defender_id,0,0,-2714,571,47,57);
    quest::spawn2($defender_id,0,0,-2747,498,51,43);
    quest::spawn2($defender_id,0,0,-2719,514,46,65);
  }
  else { #spawn southern defenders
    quest::spawn2($defender_id,0,0,-621,-2753,55,252);
    quest::spawn2($defender_id,0,0,-602,-2764,60,242);
    quest::spawn2($defender_id,0,0,-633,-2773,60,239);
    quest::spawn2($defender_id,0,0,-644,-2794,68,254);
    quest::spawn2($defender_id,0,0,-591,-2794,69,252);
  }

  quest::ze(4, "$AttackerText{$HollowshadeRace{$qglobals{$attacker}}}"); #Attacker Text
  quest::ze(4, "$HollowshadeRace{$qglobals{$defender}} in the $Camp{$qglobals{$defender}} $DefenderText{$qglobals{$defender}}."); #Defender Text
  quest::settimer("Attack", 480); #Time Allotment
}

#END File: hollowshade/War_Trigger (166257)