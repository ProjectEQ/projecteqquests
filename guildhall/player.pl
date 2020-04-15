# Guild Hall Regen Pool Script - Player Portion

sub EVENT_ENTERZONE {
  quest::settimer("ZoneIn", 3);
}

sub EVENT_TIMER {
  if ($timer eq "ZoneIn") {
    quest::stoptimer("ZoneIn");
    quest::signalwith(345004,$charid); # NPC: Zeflmin_Werlikanin Portal Crystals
  }
}

sub EVENT_POPUPRESPONSE {
  if ($popupid == 666) { #hateplaneb
    quest::movepc(186,-393,656,3); # Zone: hateplaneb
  }
  if ($popupid == 674) { #airplane
    quest::movepc(71,539,1384,-664); # Zone: airplane
  }
  if ($popupid == 15891) { #dragonscale
    #quest::movepc(442,-1954,3916,19);
  }
  if ($popupid == 2708) { #northkarana
    quest::movepc(13,1209,-3685,-5); # Zone: northkarana
  }
  if ($popupid == 4176) { #ecommons
    quest::movepc(22,-140,-1520,3); # Zone: ecommons
  }
  if ($popupid == 534) { #lavastorm
    quest::movepc(27,460,460,-86); # Zone: lavastorm
  }
  if ($popupid == 2707) { #tox
    quest::movepc(38,-916,-1510,-33); # Zone: tox
  }
  if ($popupid == 2706) { #gfaydark
    quest::movepc(54,-441,-2023,4); # Zone: gfaydark
  }
  if ($popupid == 2709) { #dreadlands
    quest::movepc(86,9658,3047,1052); # Zone: dreadlands
  }
  if ($popupid == 2284) { #iceclad
    quest::movepc(110,385,5321,-17); # Zone: iceclad
  }
  if ($popupid == 2031) { #coboltscar
    quest::movepc(117,-1634,-1065,299); # Zone: cobaltscar
  }
  if ($popupid == 3615) { #twilight
    quest::movepc(170,-1028,1338,39); # Zone: twilight
  }
  if ($popupid == 3794) { #stonebrunt
    quest::movepc(100,673,-4531,0); # Zone: stonebrunt
  }
  if ($popupid == 6180) { #wallofslaughter
    quest::movepc(300,-943,13,130); # Zone: wallofslaughter
  }
  if ($popupid == 5733) { #barindu
    quest::movepc(283,209,-515,-119); # Zone: barindu
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
    quest::movepc(219,0,110,8); # Zone: potimea
  }
  if ($popupid == 21986) { #brellsrest
    #quest::movepc(480,-23,-619,36);
  }
}

sub EVENT_CLICKDOOR
{
# This will move RoF clients to their instance, the rest are handled in the DB
  if (($client->GetClientVersionBit() & 4294967264) != 0) {
    if ($doorid == 2 || $doorid == 5) {
# Do we really need the check here?
#      if ($client->CalculateDistance(-3.4, -162.9, 6.9) <= 30) {
        quest::MovePCInstance(344, 5, 0, 588, 1.75, 260); # Zone: guildlobby
#      }
    }
  }
}
