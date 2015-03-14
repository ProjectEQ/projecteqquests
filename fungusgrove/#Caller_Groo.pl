# south cavern event caller
#

srand;

sub EVENT_SPAWN {
  $groo = 0;
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28700 => 1)) {
    $southdiff = 90;
  }
  elsif (plugin::check_handin(\%itemcount, 28701 => 1)) {
    $southdiff = 60;
  }
  elsif (plugin::check_handin(\%itemcount, 28702 => 1)) {
    $southdiff = 30;
  }
  elsif (plugin::check_handin(\%itemcount, 28704 => 1)) {
    quest::stoptimer("southsumone");
    quest::stoptimer("southsumtwo");
    quest::stoptimer("southsumthree");
    $groo = 0;
    quest::depop_withtimer();
    return 1;
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::say("Aieee! Beastie huntin' fer us! Le's go! You give me back da contract when you had nuff beasties, yub. Me quit then, an' call no more beasties. I wait a minute so you make ready. Then ya follow me, and I take ya to da cave where we find beasties..");
  quest::summonitem(28704);
  quest::settimer("sprep",60);
}

sub EVENT_TIMER {
  if ($timer eq "sprep") {
    quest::stoptimer("sprep");
    $groo = 1;
    quest::moveto(-592.8,460,-260.5);
  }
  if ($timer eq "southsumone") {
    quest::emote("moans and waves his arms, then shouts 'Graka! Mootogo Ta Naga!!'");
    quest::doanim(42);
    $smobone = int(rand(1001 - 1)) + 1;
    if (($smobone >= 1) && ($smobone <= 245)) {
      $south1 = quest::spawn2(157070,0,0,-1174,214,-379.9,0); #beast
    }
    if (($smobone >= 246) && ($smobone <= 490)) {
      $south1 = quest::spawn2(157102,0,0,-1154,164,-379.9,0); #fiend
    }
    if (($smobone >= 491) && ($smobone <= 735)) {
      $south1 = quest::spawn2(157108,0,0,-1157,263,-379.9,0); #healer
    }
    if (($smobone >= 736) && ($smobone <= 980)) {
      $south1 = quest::spawn2(157109,0,0,-1174,214,-379.9,0); #priest
    }
    if (($smobone >= 981) && ($smobone <= 983)) {
      $south1 = quest::spawn2(157089,0,0,-1154,164,-379.9,0); #katcha
    }
    if (($smobone >= 984) && ($smobone <= 986)) {
      $south1 = quest::spawn2(157077,0,0,-1157,263,-379.9,0); #takacha
    }
    if (($smobone >= 987) && ($smobone <= 989)) {
      $south1 = quest::spawn2(157078,0,0,-1174,214,-379.9,0); #chakiza
    }
    if (($smobone >= 990) && ($smobone <= 992)) {
      $south1 = quest::spawn2(157091,0,0,-1154,164,-379.9,0); #chakno
    }
    if (($smobone >= 993) && ($smobone <= 996)) {
      $south1 = quest::spawn2(157088,0,0,-1157,263,-379.9,0); #tiako
    }
    if (($smobone >= 997) && ($smobone <= 1000)) {
      $south1 = quest::spawn2(157082,0,0,-1174,214,-379.9,0); #tuchako
    }
    $smob1 = $entity_list->GetMobID($south1);
    $smobnpc1 = $smob1->CastToNPC();
    $smobnpc1->AddToHateList($npc, 1);
  }
  if ($timer eq "southsumtwo") {
    $smobtwo = int(rand(1001 - 1)) + 1;
    if (($smobtwo >= 1) && ($smobtwo <= 245)) {
      $south2 = quest::spawn2(157070,0,0,-1163.1,438,-332.6,0); #beast
    }
    if (($smobtwo >= 246) && ($smobtwo <= 490)) {
      $south2 = quest::spawn2(157102,0,0,-1163.1,438,-332.6,0); #fiend
    }
    if (($smobtwo >= 491) && ($smobtwo <= 735)) {
      $south2 = quest::spawn2(157108,0,0,-1163.1,438,-332.6,0); #healer
    }
    if (($smobtwo >= 736) && ($smobtwo <= 980)) {
      $south2 = quest::spawn2(157109,0,0,-1163.1,438,-332.6,0); #priest
    }
    if (($smobtwo >= 981) && ($smobtwo <= 983)) {
      $south2 = quest::spawn2(157089,0,0,-1163.1,438,-332.6,0); #katcha
    }
    if (($smobtwo >= 984) && ($smobtwo <= 986)) {
      $south2 = quest::spawn2(157077,0,0,-1163.1,438,-332.6,0); #takacha
    }
    if (($smobtwo >= 987) && ($smobtwo <= 989)) {
      $south2 = quest::spawn2(157078,0,0,-1163.1,438,-332.6,0); #chakiza
    }
    if (($smobtwo >= 990) && ($smobtwo <= 992)) {
      $south2 = quest::spawn2(157091,0,0,-1163.1,438,-332.6,0); #chakno
    }
    if (($smobtwo >= 993) && ($smobtwo <= 996)) {
      $south2 = quest::spawn2(157088,0,0,-1163.1,438,-332.6,0); #tiako
    }
    if (($smobtwo >= 997) && ($smobtwo <= 1000)) {
      $south2 = quest::spawn2(157082,0,0,-1163.1,438,-332.6,0); #tuchako
    }
    $smob2 = $entity_list->GetMobID($south2);
    $smobnpc2 = $smob2->CastToNPC();
    $smobnpc2->AddToHateList($npc, 1);
  }
  if ($timer eq "southsumthree") {
    $smobthree = int(rand(1001 - 1)) + 1;
    if (($smobthree >= 1) && ($smobthree <= 245)) {
      $south3 = quest::spawn2(157070,0,0,-1191,544,-335.9,0); #beast
    }
    if (($smobthree >= 246) && ($smobthree <= 490)) {
      $south3 = quest::spawn2(157102,0,0,-1131,539,-335.6,0); #fiend
    }
    if (($smobthree >= 491) && ($smobthree <= 735)) {
      $south3 = quest::spawn2(157108,0,0,-1191,544,-335.9,0); #healer
    }
    if (($smobthree >= 736) && ($smobthree <= 980)) {
      $south3 = quest::spawn2(157109,0,0,-1131,539,-335.6,0); #priest
    }
    if (($smobthree >= 981) && ($smobthree <= 983)) {
      $south3 = quest::spawn2(157089,0,0,-1191,544,-335.9,0); #katcha
    }
    if (($smobthree >= 984) && ($smobthree <= 986)) {
      $south3 = quest::spawn2(157077,0,0,-1131,539,-335.6,0); #takacha
    }
    if (($smobthree >= 987) && ($smobthree <= 989)) {
      $south3 = quest::spawn2(157078,0,0,-1191,544,-335.9,0); #chakiza
    }
    if (($smobthree >= 990) && ($smobthree <= 992)) {
      $south3 = quest::spawn2(157091,0,0,-1131,539,-335.6,0); #chakno
    }
    if (($smobthree >= 993) && ($smobthree <= 996)) {
      $south3 = quest::spawn2(157088,0,0,-1191,544,-335.9,0); #tiako
    }
    if (($smobthree >= 997) && ($smobthree <= 1000)) {
      $south3 = quest::spawn2(157082,0,0,-1131,539,-335.6,0); #tuchako
    }
    $smob3 = $entity_list->GetMobID($south3);
    $smobnpc3 = $smob3->CastToNPC();
    $smobnpc3->AddToHateList($npc, 1);
  }
}

sub EVENT_WAYPOINT_DEPART {
  $npc->SaveGuardSpot(0);
  if ($groo == 1) {
    $groo = 2;
    quest::moveto(-686,467,-261);
  }
  elsif ($groo == 2) {
    $groo = 3;
    quest::moveto(-879.1,524.3,-308.7);
  }
  elsif ($groo == 3) {
    $groo = 4;
    quest::moveto(-1005.4,612,-337.5);
  }
  elsif ($groo == 4) {
    $groo = 5;
    quest::settimer("southsumone",$southdiff);
    quest::settimer("southsumtwo",$southdiff);
    quest::settimer("southsumthree",$southdiff);
    quest::moveto(-1166.4,544.1,-337.8);
  }
  elsif ($groo == 5) {
    $groo = 6;
    quest::moveto(-1157.3,402.7,-332.6);
  }
}

sub EVENT_DEATH_COMPLETE {
  $groo = 0;
  quest::stoptimer("southsumone");
  quest::stoptimer("southsumtwo");
  quest::stoptimer("southsumthree");
}

# EOF

