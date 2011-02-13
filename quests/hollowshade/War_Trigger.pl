#BEGIN File: hollowshade/War_Trigger.pl (166257)
#Quest file for Hollowshade Moor - Hollowshade War

#Rewrite Coming Soon!

my $attacker = "";
my $target = "";
my $event = 0;
my $RandomWar = 0;
my %HollowshadeRace = (1 => "Owlbear", 2 => "Sonic Wolves", 3 => "Grimlings");
my %Camp = (1 => "North", 2 => "East", 3 => "South");
my %AttackText = (
  "Owlbear" => "Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.",
  "Sonic Wolves" => "NEED SONIC WOLVES ATTACK TEXT",
  "Grimlings" => "Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy."
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
    #Depop attackers/defenders
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
  quest::setglobal("HollowshadeNorth", 1, 0, "F");
  quest::setglobal("HollowshadeEast",  2, 0, "F");
  quest::setglobal("HollowshadeSouth", 3, 0, "F");
}

sub RESET_ZONE {
  quest::ze(15, "Zone resetting now.");
  $attacker = "";
  $target = "";
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

  if ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeEast}) {
    if (($attacker eq "HollowshadeNorth") || ($attacker eq "HollowshadeEast")) {
      $target = "HollowshadeSouth";
    }
    else {
      $target = quest::ChooseRandom("HollowshadeNorth", "HollowshadeEast");
    }
  }
  elsif ($qglobals{HollowshadeNorth} == $qglobals{HollowshadeSouth}) {
    if (($attacker eq "HollowshadeNorth") || ($attacker eq "HollowshadeSouth")) {
      $target = "HollowshadeEast";
    }
    else {
      $target = quest::ChooseRandom("HollowshadeNorth", "HollowshadeSouth");
    }
  }
  elsif ($qglobals{HollowshadeSouth} == $qglobals{HollowshadeEast}) {
    if (($attacker eq "HollowshadeEast") || ($attacker eq "HollowshadeSouth")) {
      $target = "HollowshadeNorth";
    }
    else {
      $target = quest::ChooseRandom("HollowshadeEast", "HollowshadeSouth");
    }
  }
  else {
    if ($attacker eq "HollowshadeNorth") {
      $target = quest::ChooseRandom("HollowshadeEast", "HollowshadeSouth");
    }
    elsif ($attacker eq "HollowshadeEast") {
      $target = quest::ChooseRandom("HollowshadeNorth", "HollowshadeSouth");
    }
    else {
      $target = quest::ChooseRandom("HollowshadeNorth", "HollowshadeEast");
    }
  }
  quest::ze(4, "$AttackText{$HollowshadeRace{$qglobals{$attacker}}}"); #Attacker Text
  quest::ze(4, "The $HollowshadeRace{$qglobals{$target}} in the $Camp{$qglobals{$target}} look nervous."); #Defender Text
  quest::settimer("Attack", 480); #Time Allotment
}

#END File: hollowshade/War_Trigger (166257)