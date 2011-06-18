# Guild Hall Regen Pool Script - Player Portion

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::settimer("DoRegen", 6);
  }
  if ($signal == 2) {
    quest::stoptimer("DoRegen");
  }
}

sub EVENT_ZONE {
  quest::stoptimer("DoRegen"); #Stop the timer if they zone
}

sub EVENT_TIMER {
  quest::stoptimer("DoRegen");
  my $RegenPercent = 10; # Set Regen Percent per tic here
  if ($client) {
    my $HPRatio = $client->GetHPRatio();
    if ($HPRatio < 100) {
      my $HPMax = $client->GetMaxHP();
      my $HPNew = (($HPRatio + $RegenPercent) / 100) * $HPMax;
      $client->SetHP($HPNew);
    }
    my $ManaRatio = $client->GetManaRatio();
    if ($ManaRatio < 100) {
      my $ManaMax = $client->GetMaxMana();
      my $ManaNew = (($ManaRatio + $RegenPercent) / 100) * $ManaMax;
      $client->SetMana($ManaNew);
    }
    my $EnduranceRatio = $client->GetEnduranceRatio();
    if ($EnduranceRatio < 100) {
      my $EnduranceMax = $client->GetMaxEndurance();
      my $EnduranceNew = (($EnduranceRatio + $RegenPercent) / 100) * $EnduranceMax;
      $client->SetEndurance($EnduranceNew);
    }
    quest::settimer("DoRegen", 6);
  }
}

sub EVENT_POPUPRESPONSE {
  if ($popupid == 666) { #hateplaneb
    quest::movepc(186,-393,656,3);
  }
  if ($popupid == 674) { #airplane
    quest::movepc(71,539,1384,-664);
  }
  if ($popupid == 15891) { #dragonscale
    #quest::movepc(442,-1954,3916,19);
  }
  if ($popupid == 2708) { #northkarana
    quest::movepc(13,1209,-3685,-5);
  }
  if ($popupid == 4176) { #ecommons
    quest::movepc(22,-140,-1520,3);
  }
  if ($popupid == 534) { #lavastorm
    quest::movepc(27,460,460,-86);
  }
  if ($popupid == 2707) { #tox
    quest::movepc(38,-916,-1510,-33);
  }
  if ($popupid == 2706) { #gfaydark
    quest::movepc(54,-441,-2023,4);
  }
  if ($popupid == 2709) { #dreadlands
    quest::movepc(86,9658,3047,1052);
  }
  if ($popupid == 2284) { #iceclad
    quest::movepc(110,385,5321,-17);
  }
  if ($popupid == 2031) { #coboltscar
    quest::movepc(117,-1634,-1065,299);
  }
  if ($popupid == 3615) { #twilight
    quest::movepc(170,-1028,1338,39);
  }
  if ($popupid == 3794) { #stonebrunt
    quest::movepc(100,673,-4531,0);
  }
  if ($popupid == 6180) { #wallofslaughter
    #quest::movepc(300,-943,13,130);
  }
  if ($popupid == 5733) { #barindu
    quest::movepc(283,209,-515,-119);
  }
  if ($popupid == 8237) { #eastkorlach
    #quest::movepc(362,-750,-1002,48);
  }
  if ($popupid == 8967) { #arcstone
    #quest::movepc(369,1630,-279,5);
  }
  if ($popupid == 999) { #mesa
    #quest::movepc(397,-85,-2050,19);
  }
  if ($popupid == 1000) { #guild banner
    #not implemented yet
  }
  if ($popupid == 416) { #kattacastrum
    #quest::movepc(416,-2,-425,-19);
  }
  if ($popupid == 20543) { #potimea
    quest::movepc(219,0,110,8);
  }
  if ($popupid == 21986) { #brellsrest
    #quest::movepc(480,-23,-619,36);
  }
}

sub EVENT_COMBINE_SUCCESS {
  if (($recipe_id == 10904) || ($recipe_id == 10905) || ($recipe_id == 10906) || ($recipe_id == 10907)) {
    $client->Message(15,"The gem resonates with power as the shards placed within glow unlocking some of the stone's power. You were successful in assembling most of the stone but there are four slots left to fill, where could those four pieces be?");
  }
  if ($recipe_id == 10903) {
    if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
      quest::summonitem(67666);
      quest::summonitem(67704);
    }
    elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
      quest::summonitem(67665);
      quest::summonitem(67704);
    }
    elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
      quest::summonitem(67667);  
      quest::summonitem(67704);
    }
    elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
      quest::summonitem(67668);
      quest::summonitem(67704);
    }
    $client->Message(1,"Success");
  }
  if ($recipe_id == 10346) {
    if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
      quest::summonitem(67661);
      quest::summonitem(67704);
    }
    elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
      quest::summonitem(67660);
      quest::summonitem(67704);
    }
    elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
      quest::summonitem(67662);
      quest::summonitem(67704);
    }
    elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
      quest::summonitem(67663);
      quest::summonitem(67704);
    }
    $client->Message(1,"Success");
  }
  if ($recipe_id == 10334) {
    if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
      quest::summonitem(67654);
      quest::summonitem(67704);
    }
    elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
      quest::summonitem(67653);
      quest::summonitem(67704);
    }
    elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
      quest::summonitem(67655);
      quest::summonitem(67704);
    }
    elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
      quest::summonitem(67656);
      quest::summonitem(67704);
    }
    $client->Message(1,"Success");
  }
}