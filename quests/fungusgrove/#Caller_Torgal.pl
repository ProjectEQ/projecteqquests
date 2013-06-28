# east cavern event caller
#

srand;

sub EVENT_SPAWN {
  $torgal = 0;
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28700 => 1)) {
    $eastdiff = 90;
  }
  elsif (plugin::check_handin(\%itemcount, 28701 => 1)) {
    $eastdiff = 60;
  }
  elsif (plugin::check_handin(\%itemcount, 28702 => 1)) {
    $eastdiff = 30;
  }
  elsif (plugin::check_handin(\%itemcount, 28705 => 1)) {
    quest::stoptimer("eastsumone");
    quest::stoptimer("eastsumtwo");
    quest::stoptimer("eastsumthree");
    $torgal = 0;
    quest::depop_withtimer();
    return 1;
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::say("Aieee! Beastie huntin' fer us! Le's go! You give me back da contract when you had nuff beasties, yub. Me quit then, an' call no more beasties. I wait a minute so you make ready. Then ya follow me, and I take ya to da cave where we find beasties..");
  quest::summonitem(28705);
  quest::settimer("eprep",60);
}

sub EVENT_TIMER {
  if ($timer eq "eprep") {
    quest::stoptimer("eprep");
    $torgal = 1;
    quest::moveto(-592.8,460,-260.5);
  }
  if ($timer eq "eastsumone") {
    quest::emote("moans and waves his arms, then shouts 'Graka! Mootogo Ta Naga!!'");
    quest::doanim(42);
    $emobone = int(rand(1001 - 1)) + 1;
    if (($emobone >= 1) && ($emobone <= 245)) {
      $east1 = quest::spawn2(157070,0,0,-1582,592,-379.9,0); #beast
    }
    if (($emobone >= 246) && ($emobone <= 490)) {
      $east1 = quest::spawn2(157102,0,0,-1541,613,-379.9,0); #fiend
    }
    if (($emobone >= 491) && ($emobone <= 735)) {
      $east1 = quest::spawn2(157108,0,0,-1582,592,-379.9,0); #healer
    }
    if (($emobone >= 736) && ($emobone <= 980)) {
      $east1 = quest::spawn2(157109,0,0,-1541,613,-379.9,0); #priest
    }
    if (($emobone >= 981) && ($emobone <= 983)) {
      $east1 = quest::spawn2(157089,0,0,-1582,592,-379.9,0); #katcha
    }
    if (($emobone >= 984) && ($emobone <= 986)) {
      $east1 = quest::spawn2(157077,0,0,-1541,613,-379.9,0); #takacha
    }
    if (($emobone >= 987) && ($emobone <= 989)) {
      $east1 = quest::spawn2(157078,0,0,-1582,592,-379.9,0); #chakiza
    }
    if (($emobone >= 990) && ($emobone <= 992)) {
      $east1 = quest::spawn2(157091,0,0,-1541,613,-379.9,0); #chakno
    }
    if (($emobone >= 993) && ($emobone <= 996)) {
      $east1 = quest::spawn2(157088,0,0,-1582,592,-379.9,0); #tiako
    }
    if (($emobone >= 997) && ($emobone <= 1000)) {
      $east1 = quest::spawn2(157082,0,0,-1541,613,-379.9,0); #tuchako
    }
    $emob1 = $entity_list->GetMobID($east1);
    $emobnpc1 = $emob1->CastToNPC();
    $emobnpc1->AddToHateList($npc, 1);
  }
  if ($timer eq "eastsumtwo") {
    $emobtwo = int(rand(1001 - 1)) + 1;
    if (($emobtwo >= 1) && ($emobtwo <= 245)) {
      $east2 = quest::spawn2(157070,0,0,-1311,595,-332.1,0); #beast
    }
    if (($emobtwo >= 246) && ($emobtwo <= 490)) {
      $east2 = quest::spawn2(157102,0,0,-1311,595,-332.1,0); #fiend
    }
    if (($emobtwo >= 491) && ($emobtwo <= 735)) {
      $east2 = quest::spawn2(157108,0,0,-1311,595,-332.1,0); #healer
    }
    if (($emobtwo >= 736) && ($emobtwo <= 980)) {
      $east2 = quest::spawn2(157109,0,0,-1311,595,-332.1,0); #priest
    }
    if (($emobtwo >= 981) && ($emobtwo <= 983)) {
      $east2 = quest::spawn2(157089,0,0,-1311,595,-332.1,0); #katcha
    }
    if (($emobtwo >= 984) && ($emobtwo <= 986)) {
      $east2 = quest::spawn2(157077,0,0,-1311,595,-332.1,0); #takacha
    }
    if (($emobtwo >= 987) && ($emobtwo <= 989)) {
      $east2 = quest::spawn2(157078,0,0,-1311,595,-332.1,0); #chakiza
    }
    if (($emobtwo >= 990) && ($emobtwo <= 992)) {
      $east2 = quest::spawn2(157091,0,0,-1311,595,-332.1,0); #chakno
    }
    if (($emobtwo >= 993) && ($emobtwo <= 996)) {
      $east2 = quest::spawn2(157088,0,0,-1311,595,-332.1,0); #tiako
    }
    if (($emobtwo >= 997) && ($emobtwo <= 1000)) {
      $east2 = quest::spawn2(157082,0,0,-1311,595,-332.1,0); #tuchako
    }
    $emob2 = $entity_list->GetMobID($east2);
    $emobnpc2 = $emob2->CastToNPC();
    $emobnpc2->AddToHateList($npc, 1);
  }
  if ($timer eq "eastsumthree") {
    $emobthree = int(rand(1001 - 1)) + 1;
    if (($emobthree >= 1) && ($emobthree <= 245)) {
      $east3 = quest::spawn2(157070,0,0,-1226,663,-331.9,0); #beast
    }
    if (($emobthree >= 246) && ($emobthree <= 490)) {
      $east3 = quest::spawn2(157102,0,0,-1218,638,-331.9,0); #fiend
    }
    if (($emobthree >= 491) && ($emobthree <= 735)) {
      $east3 = quest::spawn2(157108,0,0,-1210,569,-333.9,0); #healer
    }
    if (($emobthree >= 736) && ($emobthree <= 980)) {
      $east3 = quest::spawn2(157109,0,0,-1226,663,-331.9,0); #priest
    }
    if (($emobthree >= 981) && ($emobthree <= 983)) {
      $east3 = quest::spawn2(157089,0,0,-1218,638,-331.9,0); #katcha
    }
    if (($emobthree >= 984) && ($emobthree <= 986)) {
      $east3 = quest::spawn2(157077,0,0,-1210,569,-333.9,0); #takacha
    }
    if (($emobthree >= 987) && ($emobthree <= 989)) {
      $east3 = quest::spawn2(157078,0,0,-1226,663,-331.9,0); #chakiza
    }
    if (($emobthree >= 990) && ($emobthree <= 992)) {
      $east3 = quest::spawn2(157091,0,0,-1218,638,-331.9,0); #chakno
    }
    if (($emobthree >= 993) && ($emobthree <= 996)) {
      $east3 = quest::spawn2(157088,0,0,-1210,569,-333.9,0); #tiako
    }
    if (($emobthree >= 997) && ($emobthree <= 1000)) {
      $east3 = quest::spawn2(157082,0,0,-1226,663,-331.9,0); #tuchako
    }
    $emob3 = $entity_list->GetMobID($east3);
    $emobnpc3 = $emob3->CastToNPC();
    $emobnpc3->AddToHateList($npc, 1);
  }
}

sub EVENT_WAYPOINT_DEPART {
  $npc->SaveGuardSpot(0);
  if ($torgal == 1) {
    $torgal = 2;
    quest::moveto(-686,467,-261);
  }
  elsif ($torgal == 2) {
    $torgal = 3;
    quest::moveto(-879.1,524.3,-308.7);
  }
  elsif ($torgal == 3) {
    $torgal = 4;
    quest::moveto(-1005.4,612,-337.5);
  }
  elsif ($torgal == 4) {
    $torgal = 5;
    quest::settimer("eastsumone",$eastdiff);
    quest::settimer("eastsumtwo",$eastdiff);
    quest::settimer("eastsumthree",$eastdiff);
    quest::moveto(-1166.4,544.1,-337.8);
  }
  elsif ($torgal == 5) {
    $torgal = 6;
    quest::moveto(-1335.4,595.8,-332.2);
  }
}

sub EVENT_DEATH_COMPLETE {
  $torgal = 0;
  quest::stoptimer("eastsumone");
  quest::stoptimer("eastsumtwo");
  quest::stoptimer("eastsumthree");
}

# EOF

