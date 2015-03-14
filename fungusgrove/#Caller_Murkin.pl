# north cavern event caller
#

srand;

sub EVENT_SPAWN {
  $murkin = 0;
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28700 => 1)) {
    $northdiff = 90;
  }
  elsif (plugin::check_handin(\%itemcount, 28701 => 1)) {
    $northdiff = 60;
  }
  elsif (plugin::check_handin(\%itemcount, 28702 => 1)) {
    $northdiff = 30;
  }
  elsif (plugin::check_handin(\%itemcount, 28703 => 1)) {
    quest::stoptimer("northsumone");
    quest::stoptimer("northsumtwo");
    quest::stoptimer("northsumthree");
    $murkin = 0;
    quest::depop_withtimer();
    return 1;
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::say("Aieee! Beastie huntin' fer us! Le's go! You give me back da contract when you had nuff beasties, yub. Me quit then, an' call no more beasties. I wait a minute so you make ready. Then ya follow me, and I take ya to da cave where we find beasties..");
  quest::summonitem(28703);
  quest::settimer("nprep",60);
}

sub EVENT_TIMER {
  if ($timer eq "nprep") {
    quest::stoptimer("nprep");
    $murkin = 1;
    quest::moveto(-592.8,460,-260.5);
  }
  if ($timer eq "northsumone") {
    quest::emote("moans and waves his arms, then shouts 'Graka! Mootogo Ta Naga!!'");
    quest::doanim(42);
    $nmobone = int(rand(1001 - 1)) + 1;
    if (($nmobone >= 1) && ($nmobone <= 245)) {
      $north1 = quest::spawn2(157070,0,0,-1097,1077,-379.9,0); #beast
    }
    if (($nmobone >= 246) && ($nmobone <= 490)) {
      $north1 = quest::spawn2(157102,0,0,-1078,1030,-379.9,0); #fiend
    }
    if (($nmobone >= 491) && ($nmobone <= 735)) {
      $north1 = quest::spawn2(157108,0,0,-1097,1000,-379.9,0); #healer
    }
    if (($nmobone >= 736) && ($nmobone <= 980)) {
      $north1 = quest::spawn2(157109,0,0,-1097,1077,-379.9,0); #priest
    }
    if (($nmobone >= 981) && ($nmobone <= 983)) {
      $north1 = quest::spawn2(157089,0,0,-1078,1030,-379.9,0); #katcha
    }
    if (($nmobone >= 984) && ($nmobone <= 986)) {
      $north1 = quest::spawn2(157077,0,0,-1097,1000,-379.9,0); #takacha
    }
    if (($nmobone >= 987) && ($nmobone <= 989)) {
      $north1 = quest::spawn2(157078,0,0,-1097,1077,-379.9,0); #chakiza
    }
    if (($nmobone >= 990) && ($nmobone <= 992)) {
      $north1 = quest::spawn2(157091,0,0,-1078,1030,-379.9,0); #chakno
    }
    if (($nmobone >= 993) && ($nmobone <= 996)) {
      $north1 = quest::spawn2(157088,0,0,-1097,1000,-379.9,0); #tiako
    }
    if (($nmobone >= 997) && ($nmobone <= 1000)) {
      $north1 = quest::spawn2(157082,0,0,-1097,1077,-379.9,0); #tuchako
    }
    $nmob1 = $entity_list->GetMobID($north1);
    $nmobnpc1 = $nmob1->CastToNPC();
    $nmobnpc1->AddToHateList($npc, 1);
  }
  if ($timer eq "northsumtwo") {
    $nmobtwo = int(rand(1001 - 1)) + 1;
    if (($nmobtwo >= 1) && ($nmobtwo <= 245)) {
      $north2 = quest::spawn2(157070,0,0,-1095,812,-334,0); #beast
    }
    if (($nmobtwo >= 246) && ($nmobtwo <= 490)) {
      $north2 = quest::spawn2(157102,0,0,-1095,812,-334,0); #fiend
    }
    if (($nmobtwo >= 491) && ($nmobtwo <= 735)) {
      $north2 = quest::spawn2(157108,0,0,-1095,812,-334,0); #healer
    }
    if (($nmobtwo >= 736) && ($nmobtwo <= 980)) {
      $north2 = quest::spawn2(157109,0,0,-1095,812,-334,0); #priest
    }
    if (($nmobtwo >= 981) && ($nmobtwo <= 983)) {
      $north2 = quest::spawn2(157089,0,0,-1095,812,-334,0); #katcha
    }
    if (($nmobtwo >= 984) && ($nmobtwo <= 986)) {
      $north2 = quest::spawn2(157077,0,0,-1095,812,-334,0); #takacha
    }
    if (($nmobtwo >= 987) && ($nmobtwo <= 989)) {
      $north2 = quest::spawn2(157078,0,0,-1095,812,-334,0); #chakiza
    }
    if (($nmobtwo >= 990) && ($nmobtwo <= 992)) {
      $north2 = quest::spawn2(157091,0,0,-1095,812,-334,0); #chakno
    }
    if (($nmobtwo >= 993) && ($nmobtwo <= 996)) {
      $north2 = quest::spawn2(157088,0,0,-1095,812,-334,0); #tiako
    }
    if (($nmobtwo >= 997) && ($nmobtwo <= 1000)) {
      $north2 = quest::spawn2(157082,0,0,-1095,812,-334,0); #tuchako
    }
    $nmob2 = $entity_list->GetMobID($north2);
    $nmobnpc2 = $nmob2->CastToNPC();
    $nmobnpc2->AddToHateList($npc, 1);
  }
  if ($timer eq "northsumthree") {
    $nmobthree = int(rand(1001 - 1)) + 1;
    if (($nmobthree >= 1) && ($nmobthree <= 245)) {
      $north3 = quest::spawn2(157070,0,0,-1076,705,-335.9,0); #beast
    }
    if (($nmobthree >= 246) && ($nmobthree <= 490)) {
      $north3 = quest::spawn2(157102,0,0,-1059,736,-331.9,0); #fiend
    }
    if (($nmobthree >= 491) && ($nmobthree <= 735)) {
      $north3 = quest::spawn2(157108,0,0,-1076,705,-335.9,0); #healer
    }
    if (($nmobthree >= 736) && ($nmobthree <= 980)) {
      $north3 = quest::spawn2(157109,0,0,-1059,736,-331.9,0); #priest
    }
    if (($nmobthree >= 981) && ($nmobthree <= 983)) {
      $north3 = quest::spawn2(157089,0,0,-1076,705,-335.9,0); #katcha
    }
    if (($nmobthree >= 984) && ($nmobthree <= 986)) {
      $north3 = quest::spawn2(157077,0,0,-1059,736,-331.9,0); #takacha
    }
    if (($nmobthree >= 987) && ($nmobthree <= 989)) {
      $north3 = quest::spawn2(157078,0,0,-1076,705,-335.9,0); #chakiza
    }
    if (($nmobthree >= 990) && ($nmobthree <= 992)) {
      $north3 = quest::spawn2(157091,0,0,-1059,736,-331.9,0); #chakno
    }
    if (($nmobthree >= 993) && ($nmobthree <= 996)) {
      $north3 = quest::spawn2(157088,0,0,-1076,705,-335.9,0); #tiako
    }
    if (($nmobthree >= 997) && ($nmobthree <= 1000)) {
      $north3 = quest::spawn2(157082,0,0,-1059,736,-331.9,0); #tuchako
    }
    $nmob3 = $entity_list->GetMobID($north3);
    $nmobnpc3 = $nmob3->CastToNPC();
    $nmobnpc3->AddToHateList($npc, 1);
  }
}

sub EVENT_WAYPOINT_DEPART {
  $npc->SaveGuardSpot(0);
  if ($murkin == 1) {
    $murkin = 2;
    quest::moveto(-686,467,-261);
  }
  elsif ($murkin == 2) {
    $murkin = 3;
    quest::moveto(-879.1,524.3,-308.7);
  }
  elsif ($murkin == 3) {
    $murkin = 4;
    quest::moveto(-1005.4,612,-337.5);
  }
  elsif ($murkin == 4) {
    $murkin = 5;
    quest::settimer("northsumone",$northdiff);
    quest::settimer("northsumtwo",$northdiff);
    quest::settimer("northsumthree",$northdiff);
    quest::moveto(-1090.8,717.4,-333.5);
  }
  elsif ($murkin == 5) {
    $murkin = 6;
    quest::moveto(-1098,865.7,-332.5);
  }
}

sub EVENT_DEATH_COMPLETE {
  $murkin = 0;
  quest::stoptimer("northsumone");
  quest::stoptimer("northsumtwo");
  quest::stoptimer("northsumthree");
}

# EOF

